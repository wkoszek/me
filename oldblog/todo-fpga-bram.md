Single cycle CPU design - lessons learnt
========================================

Getting something simple working quickly is possible.

Starting from purely abstract data model, also known as:

	reg [31:0]  mylovelymem[0:1023]

is good to see that trivial stuff works, but is generally a bad idea. Try to
move to some more real memory model as soon as possible.

Lint tool embeddded in Verilator is an extremely useful tool for figuring out
where multi-bit bus has gotted wire assigned.

The more tools you can pass your RTL through, the better. Icarus and
Verilator aren't perfect, but are better than nothing.

Lessons learnt from BRAM instantiantion
---------------------------------------

Approaching relatively trivial problems with little preparation isn't the
way to go, since you feel stupid, if something goes wrong.

Documentation is misleading and it's much better to sometimes abandon
"previous research" and do stuff by yourself, by figuring things out from
the source code.

While creating .bmm file remember that first column has HEX numbers.
Remembering this will save you some frustration related with seeing stuff
which you don't expect to see.

Chipscope is a very nice tool, which has negative development time.
Mastering Chipscope should be high on your TODO list if you plan playing
with FPGAs seriously [alternatively, implementing your own debugging
solution].

Muxes help a lot with Chipscope.  While instantiating ILA, make SYNC_OUT
port enabled. Having 8 bits which you can control from the GUI helps you a
lot!

It's really nice to have a handy development environment.

There's a nice glbl.v with all signals you'll ever need in unisims/ library.

glbl.GSR is pretty important.

Picking a timescale for Verilog simulation is interesting
