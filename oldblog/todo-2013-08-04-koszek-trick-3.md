Debuggers no no no
-------------------------

**Wojciech A. Koszek**

There were times in the past where I just couldn't start working on a
programming problem without having all debugging tools behind my belt. Over the years
I realized I never actually used any of them. 

I do use GDB sometimes -- just as a C-compliant calculator.  And I only do
it on new systems, where I don't have my copy of calc(1) lying around.
[calc(1) is known as apcalc on some systems -- and if you're playing with
bits in C or embedded systems programming, you should consider giving it a
try]

So... most people say debuggers are excellent. Maybe they are, but only
sometimes, and I strongly feel debuggers are time consuming and hard to
setup. I never really found a debugger for non-x86 CPU that would just work.

I find my way without a debugger. For C programming I found most of
problems I can solve quickly with:

	printf("%s:%d here\n", __func__, __LINE__)

typically put in the instrumented code in a very visible way:


	 10         while (1) {
	 11                 regval = asm_read_le32(addr);
	 12                 if ((regval & mask) == val) {
	 13 printf("%s:%d\n", __func__, __LINE__);
	 14                         return;
	 15                 }
	 16                 cnt++;

I use it for very quick throw-away hacking. When I work on something more
complex, I typically start with my typical toolbox item:

	#define DBG(...)	do {			\
		printf("%s:%d", __func__, __LINE__);	\
		printf(__VA_ARGS__);			\
		printf("\n");				\
	} while (0)

which you use like this:

	DBG("here, arg=%d", arg);


which is basically (both code and the macro itself) a piece of junk 
ANSI C purists will hate, but which is very, very useful. Reasons:

1. helps you identify places in code which your program has reached

2. lets you pass arbitrary messages to your debugging routine

3. lets you save "\n" typing, which helps with code with 80-column limit

The nice thing about it is that if you're done with using the macro, you can
throw:

	if (1) {
		break;
	}

inside of it and have it be prepared for occasional program expansion in the
future and the need for further debugging. Oh, and by the way -- you better
have:

	setbuf(stdout, NULL);
	setbuf(stderr, NULL);

as a first stuff in your `main()` if you use those methods for debugging.
Some problems lead to program's quite failure, and I/O buffers printf() is
using sometimes don't get flushed.

This concept of "printouts" is old as programming world and isn't too niche.
However what do you do to debug assembly code?

In the last couple of weeks I'm working on porting relatively big and
complex hybrid of C/ARM assembly code, where things from C call routines
from assembly, and most often than not die somewhere there. Dying is defined
as:

	"Program performs unknown, undefined, probably unspecified or
	dangerous action which gets represented to the engineer as a machine
	hang"

So basically you get:

	"Trying to do X..."

and nothing after that. Now this isn't critical and hard, if you have
ultra-smart IDE with UI with AI-based engine for debugging. You basically
step through instructions one by one and quickly see which instructions is
causing a failure. Then, based on the knowledge and data from the tool,
you're able to quickly see, sometimes in a graphical way, what is causing a
failure.

Sometimes however:

1. chip maker won't provide you working tools for your environment

2. there's no time to re-learn new IDEs

3. lack of resources

In cases like that you basically have to figure out your own toolbox.

@@@RIGHT@@@
