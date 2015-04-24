For the last several weeks with varied levels of intensity I'm studying
Verilog standard. As I go, I'm slowly getting rid of sequential attitude of doing
things, and growing more and more analogies between my programming and
digital-design experience. With the hope of letting other software people start to
understand the digital world a bit more, I decided to write how I think it
works, with absolutely no guarantee it's right or wrong. 

Over the last several years, oh well, poor me, I've programmed in a
sequential way. 

For now lets concentrate on the simple cases: simple scrachpad UNIX program
running from the command line. Maybe Python or Perl or Ruby or PHP or Lua
scripts. Basically anything that starts in line 1 and finished at line 101
after some time.

Idea of this sequential execution was the same everywhere -- you have
instructions lined up for the execution, and as the program flows through
the source code lines, stuff gets executed. With or without conditional
execution, with or without loops and other control statements, the program
reaches end.

The things that can prevent your program from working right are: unhandled
edge-case, unexpected behavior of the API, resource exhaustion etc.. But
everything is somehow sequential, since basically everything that you do is
contained within one body of the program.

Now things get messed up a bit when you add some bits of asynchronous
behavior, like UNIX signals. So for example you run through your looks, but
suddenly: Oppps... and you process gets SIGILL and you have to react
somehow. But still: for the signal handler registered, you'll just jump to
it, do some minimal processing and get back from where you stopped.

You see, to make matters worse, you can mess this image up a bit more: now
assume your program is multithreaded and you still have if's, else's, for's
and other control statements, but replicated N times. And these N copies of
your program basically see the same data, and must somehow share the data in
a consistent way, so that when thread A and B access structure MYDATA,
things get modified in a relatively decent way, with which program is able
to cope.



Digital design was something I haven't had a chance to work for a living yet,
but what fits my kind of thinking, since as a very simple person.
Creating abstractions from CLK singal toggling back and forth is basically
the amount of abstract complexity I can handle.

Don't get me wrong. I find:

	[f(x): x*x] for x in range(0, 2.5, 10):
		print x

in Python very appealing, just I truly like:

	my @dir_ents = grep { /^(\d{4}-\d{2}-\d{2}).*/ } <.*>;

in Perl. DBut signals are things that I can work on nicely


So Verilog is actually pretty simple, yet powerful enough that can cause
lots of trouble and confusion.

The way I see Verilog is:

1) tool for modelling combinational logic

2) latch generator

3) sequential logic generator

4) confusion generator

Sequential vs schematic

Verilog == textual tool for explaining schematic. Basically how the
schematic would look like, if you were to translate this barely readable
pseudo-English description to the paper.

The source of confusion comes from two factors -- two most important words
"reg" and "wire" which declare, respectively, "register" and "wire" have
interchangable meaning.

The way to think about "wire" is the line on the schematic.

My mental model for modelling combinational logic blocks with always blocks:

1) black box which is about to have inputs

2) how many inputs

3) put inputs in sensitivity list

4) what are the input complements

4a) do your stuff with if/else

5) what steers values flowing from inputs and inputs complements to outputs

6) how many outputs and what they are


