People often ask me what I did when I was a part of the while I was a part
of the hardware industry. To some extent the hardware industry is about ...
hardware.

Board is started, program is run and board is restarted.
Program spits something through the serial cable, and this thing is recorded
in a log file.
Basically, in a bit simplified view, it looks like this:

	PASS

or:

	FAIL

Inability of identifying FPGA devices by simply seeing their unique ID was
obvious an obvious problem since the day number ... 2.

There were several options for how this could be solved, but I never really had
time to look into them.
Since my responsibilities switched and I had some more time to look at AXI
specification and some HDL primitives for Xilinx FPGAs, I have finally found
solution to this problem -- __AXI_devinfo__

__AXI_devinfo__ is a slave device which understands AXI4-Lite protocol and is
able to return following information to the AXI master:

1. ``DNA`` -- FPGA unique DNA number: 57-bits of data identifying Xilinx chips.

2. ``EFUSE`` -- 32-bit register

3. ``USR_ACCESS`` -- 32-bit register which ``bitgen`` knows how to embed in
   a bitstream without a need or design re-synthesizing.

Following is the address map of __AXI_devinfo__:

	Address Map
	===========
	0x00		reg0_version		Version register
	0x04		reg1_dnahi		DNA[63:32]
	0x08		reg2_dnalo		DNA[31:0]
	0x0c		reg3_usraccesse2	USR_ACCESSE2 output
	0x10		reg4_efuseusr		EFUSE output
	0x14		reg5_startup		Startup sequence?

Here's the crucial chunk of the IP core -- DNA fetching:

	wire		dna_dout;
	reg[7:0]	dna_cnt_r = 0;
	wire		dna_ready = dna_cnt_r[7:0] > 57;
	wire[7:0]	dna_cnt = !dna_ready ? dna_cnt_r[7:0] + 8'd1 : dna_cnt_r[7:0];
	wire		dna_read = dna_cnt_r[7:0] == 8'd0;
	reg		dna_read_r = 0;
	wire		dna_shift = ~dna_read && ~dna_ready;
	reg[63:0]	dna_reg_r = 64'd0;
	wire[63:0]	dna_reg_shifted = { dna_reg_r[62:0], (dna_dout === 1'b1) };
	wire		dna_start = dna_read_r && dna_shift;		// start
	wire		dna_end = (dna_read | dna_shift) == 0;		// finish
	wire[63:0]	dna_reg = (dna_start || dna_end) ? dna_reg_r : dna_reg_shifted;

DNA switch register control. ``dna_dout`` gets output data from ``DNA_PORT``
primitive. ``dna_cnt_r[]`` will keep incrementing till whole DNA (57 bits)
are captured. Once this happens, ``dna_ready`` will go high.
``DNA_PORT`` primitive works in a such a way that its READ input must be
asserted first, after which SHIFT input must receive series of pulses
to start shifting data back. ``dna_read`` drives READ, while ``dna_shift`` SHIFT
wires. SHIFT is held high unless READ of ``dna_ready`` are asserted (it's low
if READ is asserted or we're done with whole DNA). ``dna_reg_r`` holds full
DNA value. For convenience it's 64-bit register. ``dna_start/dna_end``
recognize start/stop condition for DNA capturing in ``dna_reg_r``.

Following are the registers which I use for exporting interesting
information through AXI.

	reg[31:0]	reg0_version_r = 0;
	wire[31:0]	reg0_version = `AXI_DEVINFO_VERSION;
	reg[31:0]	reg1_dnahi_r = 0;
	wire[31:0]	reg1_dnahi = dna_reg_r[63:32];
	reg[31:0]	reg2_dnalo_r = 0;
	wire[31:0]	reg2_dnalo = dna_reg_r[31:0];
	reg[31:0]	reg3_usraccesse2_r = 0;
	wire[31:0]	reg3_usraccesse2;
	reg [31:0]	reg4_efuseusr_r = 0;
	wire [31:0]	reg4_efuseusr;

Latched read address from AR channel is used to perform address decoding.
I convert from binary sequential to one-hot encoding to ease figuring out
which address we're accessing.

	wire[15:0]	rd_reg_idx = 1 << araddr_r[5:2];
	wire[31:0]	rdata =
			((rd_reg_idx[0] == 1'b1)  ? reg0_version_r[31:0] : 32'd0) 	|
			((rd_reg_idx[1] == 1'b1)  ? reg1_dnahi_r[31:0] : 32'd0) 	|
			((rd_reg_idx[2] == 1'b1)  ? reg2_dnalo_r[31:0] : 32'd0) 	|
			((rd_reg_idx[3] == 1'b1)  ? reg3_usraccesse2_r[31:0] : 32'd0)	|
			((rd_reg_idx[4] == 1'b1)  ? reg4_efuseusr_r[31:0] : 32'd0)	|
			((rd_reg_idx[5] == 1'b1)  ? 32'd0 : 32'd0 ) |
			((rd_reg_idx[6] == 1'b1)  ? 32'd0 : 32'd0 ) |
			((rd_reg_idx[7] == 1'b1)  ? 32'd0 : 32'd0 ) |
			((rd_reg_idx[8] == 1'b1)  ? 32'd0 : 32'd0 ) |
			((rd_reg_idx[9] == 1'b1)  ? 32'd0 : 32'd0 ) |
			((rd_reg_idx[10] == 1'b1) ? 32'd0 : 32'd0 ) |
			((rd_reg_idx[11] == 1'b1) ? 32'd0 : 32'd0 ) |
			((rd_reg_idx[12] == 1'b1) ? 32'd0 : 32'd0 ) |
			((rd_reg_idx[13] == 1'b1) ? 32'd0 : 32'd0 ) |
			((rd_reg_idx[15] == 1'b1) ? 32'd0 : 32'd0 );

AXI handling is pretty minimal and not quite complete, but is enough to
actually not hang the AXI master and get the data back:

	assign		arready_o = 1'b1;
	assign		rid_o = arid_r;
	assign		rdata_o = rdata;
	assign		rresp_o = 0;
	assign		rlast_o = 1'b1;
	assign		ruser_o = 0;
	assign		rvalid_o = arvalid_r;

All flip-flops which I make use of are present in the ``always`` block:

	integer cycle_num = 0;
	always @(posedge clk_i) begin
		cycle_num <= cycle_num + 1;

		arvalid_r <= rst_i ? 0 : arvalid_i;
		awvalid_r <= rst_i ? 0 : awvalid_i;
		wvalid_r <= rst_i ? 0 : wvalid_i;
		arid_r <= rst_i ? 0 : arid_i;
		awid_r <= rst_i ? 0 : awid_i;
		wid_r <= rst_i ? 0 : wid_i;
		araddr_r[31:0] <= rst_i ? 0 : araddr_i[31:0];
		awaddr_r[31:0] <= rst_i ? 0 : awaddr_i[31:0];
		wdata_r[31:0] <= rst_i ? 0 : wdata_i[31:0];
		
		dna_cnt_r <= rst_i ? 8'd0 : dna_cnt;
		dna_reg_r <= rst_i ? 64'd0 : dna_reg;
		dna_read_r <= rst_i ? 1'b0 : dna_read;

		reg0_version_r[31:0] <= rst_i ? 0 : reg0_version[31:0];
		reg1_dnahi_r[31:0] <= rst_i ? 0 : reg1_dnahi[31:0];
		reg2_dnalo_r[31:0] <= rst_i ? 0 : reg2_dnalo[31:0];
		reg3_usraccesse2_r[31:0] <= rst_i ? 0 : reg3_usraccesse2[31:0];
		reg4_efuseusr_r[31:0] <= rst_i ? 0 : reg4_efuseusr[31:0];

		$display("%d %d dna_dout=%d dna_read:%d dna_read_r:%d dna_shift:%d ",
			"dna_cnt_r=%x dna_reg_r=%x", $time, cycle_num, dna_dout,
				dna_read, dna_read_r, dna_shift, dna_cnt_r, dna_reg_r);
	end

While DNA requires some work to get 57-bit value in a convenient form,
``USR_ACCESS`` and ``EFUSE_USR`` just drive their values in 32-bit form
already. In other words: no work is required. ``axi_devinfo.v`` will tell
you more.
