What every software engineer should know about FPGAs
-----------------
**by Wojciech Koszek**
%%inc/addthis.html%%


A friend of mine Charles once asked me how does these FPGAs play well in a world, where
people sell ready-to-use multiple-core micro-controllers, which run fast
enough to fit into most of the nowadays systems.

I decided to write a longer post about FPGAs in general, and since I haven't
found too much about general understanding of FPGAs, I claim this is one of
the first post of that kind. Ha!

Since I personally have a bit of a background in computer software
(science?), it relatively easy to pick up concepts somehow tied to
programming languages and the structure of programs.  I know you are
probably the same, since the subject of this article might have caused your
attention. Charles, I know you read it too, so don't be lazy, don't just
skim, don't look around COHO -- just read through!

So, dear reader, maybe you are just like me, interested in low-level aspects
of computer chips and you want to understand a bit more of the FPGA topics.
Since my job started to be tied to FPGAs, I somehow forgotten how the
beginnings looked like. So maybe you're a software engineer forced to work
with FPGA technology and you don't know how to bite a piece of this new
cake, and you'd like to learn about basics.

My first contact with this technology was more about meeting a witch in the
middle aged Europe.  However, very soon I realized it's a technology I
always wanted to have, but didn't really know it exists and so I didn't even
know what to type in the Internet.

But there was this one day, where I kept sitting in my usual place no. 54 in
the Public Library of Czestochowa, when I stumbled upon Appendix B of
truly magnificent:

<iframe src="http://rcm.amazon.com/e/cm?lt1=_blank&bc1=FFFFFF&IS1=1&npa=1&bg1=FFFFFF&fc1=000000&lc1=FF0000&t=wojcadamkoszh-20&o=1&p=8&l=as4&m=amazon&f=ifr&ref=ss_til&asins=B006FG1HNM" style="width:120px;height:240px;" scrolling="no" marginwidth="0" marginheight="0" frameborder="0"></iframe>

Appendix B, which I had, along with other appendices, printed and bound.
was hard for me to consume with high ratio of understanding. I got most of
the stuff, but didn't quite get how am I suppose to apply it to real world.
FPGAs came next. Not sure who I learnt about FPGAs from, but I'm pretty sure
it was the same book.

The concept of FPGAs seemed easy, but understanding of the internals was hard. When I
explain complex problems to other people, I typically assume (1) 0 prior
knowledge in the subject and I try to figure out from facial expressions of
the listener how much stuff I can assume is implicit and skip (2) use
analogies. Let me use an analogy. Analogy will have "leaks", but the big
picture will remain the same.

**So what it is this ... FPGA chip?**

Imagine you've got a big whiteboard.
You have multiple colorful pens.
All are easily erasable (if it helps you, and I'm sure it is, imagine the
whole situation happening in the XXI century cubical environment).
You have a sketch on smaller sheet of paper of what you're going to draw.
You transfer the sketch to the whiteboard, and you try to make it as
accurate as possible.
Your sketch looked excellently on the paper, and it was absolutely stunning.
However, as you transfer it on the whiteboard, you notice it isn't quite as
appealing as it used to be while being small and handy.
But you keep transferring it, since you're almost done -- there's no reason
to get back at this stage.
After completing the whiteboard version, you put pens aside happily.
You decide to take a tea break, and as you're getting further away from the
whiteboard, you notice something isn't quite right. Whiteboard's content
isn't quite as you have imagined. Its contents is far from perfect.


Little sheet of paper is what specification is for digital design. Typically
specification comes in either of two possible forms: schematic or HDL
specification. The latter literally means a description language of the
electronic circuit.




FPGAs are for digital design to what whiteboard is for drawing.



Who is this article really for?

If you don't want to understand how to design and make your own processors,
this article is not for you. Unless you want to be able to accelerate
algorithms to be executed REALLY fast, feel free to skip this page. And this
article is certainly not for you, if having a chance to shape the whole
System-on-the-chip doesn't sound interesting for you.  Otherwise, you may
read on.

.. image:: 2.jpg
   :scale: 35

FPGA technology is quite new when compared to other branches of the
electronics industry. Although logic design is around for nearly 200 years,
deploying it into the electronic (and mechanic) products has been possible
since mid-40'ies. However, it hadn't been till the intruduction of VLSI
circuits that builing simple digital logic projects started to be possible
at home.

FPGA let you to take a specification of your digital logic circuit,
translate it to the ASIC-alike device and see if your design works in
practice. FPGAs are nothing more than a sea of gates, which can be connected
at will with constraints specified by a designer. Programming an FPGA (i.e.:
shaping the connections) is done in volatile RAM memory -- if something is
wrong with your design, you're free to fix your system's specification and
try once again. This doesn't cost your anything, except your time and
patience.

Current state of FPGAs pushed logic design in the order to magnitute
further, letting engineers, students, professors and researchers to exploit
the real nature of digital systems at home.

Starting points
---------------

FPGA (Field Programmable Gate Arrays) are basically arrays of programmable
blocks.

.. image:: 0_fpga_basic.jpg
   :scale: 45

Each block has a fixed subset of functionality. It can:

* implement *combinational logic*: all possible logic functions with a
  certain number of inputs can be generated in the logic block. Result
  derived with the equations specified by the designer, can be output with
  one or more wires coming out of the configurable block.

* implement *state logic* (ie.: memory). Configurable cells contain
  flip-flops, which can serve as a memory resource for out design.

.. image:: 1_logicblock_basic.jpg
   :scale: 45

Imagine a grid paper, with white rectangles being a programmable blocks and
grid being an interconnect. Interconnect is a glue that ties
everything together. It is you who specified both the blocks'
configuration and internconnect connections. This is what FPGA is all about
in a bit simplified view. You must tell to the FPGA circuit how it's
supposed to configure itself and how to connect each block to make your
circuit work as expected. Read on to get more details.

.. image:: 2_fpga_stuct_basic.jpg
   :scale: 45

In other words, think of an FPGA as a breadboard for chip's parts. Or rather
--  FPGA is for logic design what LEGO bricks are for mechanical engineers
(or kids). Two big names in the FPGA business are: Xilinx and Altera. Two
competitors leading the market of reprogrammable chips basically shape the
area and eco-system.  Within this article, I will keep these two companies
in mind, since you're very likely to have a contact with their devices,
however most of my knowledge touches Xilinx devices. Xilinx FPGAs are the
most familiar to me.

Beauty of an FPGA
-----------------

Logic blocks can perform any logic equation, since their "body" is simply a
lookup table. Number of inputs (NIN) of the block specifies number of
columns of the lookup table.  Number of rows is equal to 2^NIN. It basically
means logic block can craft any combinational equation of "NIN" signals.
Input data, being the indexes into the table's rows, output the values from
the table's content. It is possible to have more than one output, but this
feature is manufacturer-specific.

There is no need to configure blocks by hand - chip manufacturers provide
CAD/EDA tools to keep the user away from nasty details and let him to
specify the circuit function.

Begin able to get any equation from the Lookup's Table means that unless you
do something rather complex, there's no need to perform any kind of logic
reduction. Modern FPGAs are getting very big, and from family to family of
devices the need of changing your design to fit it to the FPGA resources
becomes less frequent.

Where does interconnect come into the picture? Interconnect is able to route
both: the high-speed clock signal and lower-speed signals coming from logic
blocks. However, with still increasing complexity of modern circuits it
would have been really problematic to specify block-to-block connections.
FPGA designers recognized the problem and fortunately for all of us
interconnect is made transparent to the user.  Once we have our design
specified in any form (Hardware Description Language, schematic), FPGA
manufacturer's tools take care of interconnect configuration.

Simply speaking: by translating a circuit description from schematic/HDLs
language, we're able to get working design by NOT thinking of the whole
complexity of the FPGA structure.

Schematic vs HDL
----------------

There are two schools of specifying digital logic circuits:

* Schematics

* Hardware Description Languages

Schematics are the most common form of digital logic representation. The
most commonly met in the academia, they're the standard way of the
industrial documentation, too. Most digital design books concentrate on
schematics as well. Even though nice and self documentation, schematics have
a major disadvantages:

* there isn't any industry standard for schematics representation. It breaks
  the interoperability between projects written in a different tools coming
  from different manufacturers

* schematics are have "spatial problem" - in order to make schematics
  readable, it must consume a lot of space, and the amount of "redundand
  data" is quite big here - each block/logic gate much have a rectanble, two
  inputs in form of lines. And lines have to start and end somewhere,
  meaning we have to direct them correctly.

The other form of logic design principle is the use of Hardware Description
Languages. HDLs are the standarized textual data formats for describing
digital logic circuits. You're able to use your faviourite text editor to
craft a file explaining the structure of your circuit. Then, you can take
resulting file to simulate your design and check its correctness. Finally,
you use the very same file to synthetize the circuit to the device of your
choice.

HDLs are for FPGAs what programming languages are for typical processor.
Just like we have C, C++ and Java for typical, sequential programming we may
have either VHDL and Verilog. In this article we concentrate of Verilog,
which is belived to be the basis for next-generation synthesis and
verification tools. However, it is a known fact that both languages have
their pros and cons, and a choice largely depends on subjective factors
(personal preferences, geographical location, availability of resources
related to them).

Internet
--------

Did you get interested in FPGAs after reading this text?

Multiple places in the Internet touch the topic of FPGA and FPGA-related
design. I have found:

        ``http://www.fpga4fun.com/``

useful, but is far from perfect. For HDL source code, you definitely must
see OpenCores website:

        ``http://www.opencores.org/``

And simply pick several projects of your interest and start reading source
code. I don't know any other better way.

Books
-----

Unfortunately there are very few books threating on FPGA-related design.

I can recommend device-specific documentation of the particular chip's
family. For example, Spartan 6 has a nice set of documents explaining
device's functionality and `Spartan-6 FPGA Configurable Logic Block`_
explains some basic concepts of CLB - logic blocks in Xilinx terminology.

.. _`Spartan-6 FPGA Configurable Logic Block`: http://www.xilinx.com/support/documentation/user_guides/ug384.pdf

For the general concept and a bit of background (very useful) for FPGA work,
here are the few which I had a chance to see and which I can recommend:

.. image:: patterson-hennessy-4ed.jpg
   :scale: 35

*Computer Organization and Design, Fourth Edition, Fourth Edition: The
Hardware/Software Interface (The Morgan Kaufmann Series in Computer
Architecture and Design)* It's a classic text on computer architecture by
Hannessy and Patterson. Book comes with the CD, which contains appendix "B",
explaining basics of logic design in Verilog.

.. image:: 0792376722.01._SX240_SCLZZZZZZZ_.jpg
   :scale: 50

*Verilog Quickstart: A Practical Guide to Simulation and Synthesis in
Verilog* Lee's book is relatively good and takes you throught the most
popular Verilog constructs.

.. image:: contemporary_logic.jpg
   :scale: 30

*Contemporary Logic Design (2nd Edition)* Katz's book is excellent. Doesn't
contain too much FPGA-specific data, but has both qualitative and
quantitative view on the digital logic design topic. This book also touches
the topic of FPGAs.

Articles
--------

When it comes to articles, Xilinx XAPP notes can be considered source no. 1
in terms of logic implementation on Xilinx devices. XAPP notes are
domain-specific articles for solving practical problems.  Using Google
you'll see a lot of references to xappNUMBER.pdf files - these are XAPP
notes mentioned here. Here's a Xilinx website, where you may want to search
for them explicitly:

       ``http://www.xilinx.com/support/``

Clifford Cummings and his:

       ``http://www.sunburst-design.com/``

is a source of a lot of very interesting and competent articles about basics
(and not only) of Verilog-based design.

Usenet
------

USENET is an excellent source of the information about modern FPGA-based
systems. It is the case thanks to following place:

        ``comp.arch.fpga``

Newsgroup contains a lot of very experienced people who are willing to help
other FPGA users should they encounter harder problems. Please remember to
use this resource with caution. Messages posted on the newsgroup are likely
to be read by dozens of very busy people around the word.

Conclusions
-----------

Hopefully this article has helped you. At least just a bit.
