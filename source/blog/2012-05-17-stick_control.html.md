---
title:	"01001011, or on the art of snare drum patterns"
author: "Wojciech Adam Koszek"
_layout: post
description: >
  Improvised use of Verilog and C and blending it with my drumset interests.
address: "East Palo Alto, CA"
tags:
- "software engineering"
auth:	Wojciech Koszek
ads:
- <iframe src="http://rcm-na.amazon-adsystem.com/e/cm?lt1=_blank&bc1=FFFFFF&IS2=1&npa=1&bg1=FFFFFF&fc1=000000&lc1=FF0000&t=wkoszek-20&o=1&p=8&l=as4&m=amazon&f=ifr&ref=ss_til&asins=1892764040" style="width:120px;height:240px;" scrolling="no" marginwidth="0" marginheight="0" frameborder="0"></iframe>
- <iframe src="http://rcm-na.amazon-adsystem.com/e/cm?lt1=_blank&bc1=FFFFFF&IS2=1&npa=1&bg1=FFFFFF&fc1=000000&lc1=FF0000&t=wkoszek-20&o=1&p=8&l=as4&m=amazon&f=ifr&ref=ss_til&asins=0757995403" style="width:120px;height:240px;" scrolling="no" marginwidth="0" marginheight="0" frameborder="0"></iframe>
spellcheck-allow:
- "de"
- "facto"
- "Chapin"
---

Below is my short experiment on finding an analogy between two of things I
like: computers and music. Sometimes when I think about snare drum
technique, I really feel it's the most awkward activity which human being
came up with.

Really. Think about it for a moment.

Adult man takes a pair of wooden sticks, plastic head stretched on the wooden, round
frame, which resonates and makes stretched head's surface pretty damn loud and starts hitting this
surface. On purpose. For a long time, with high level concentration, heading towards perfection in
the evenness of strokes and sounds.

Driving his neighbors crazy too.

Hits aren't random, if you know what you're doing. These are actual sequences on hits. You
can subdivide hits to several groups, based on the grip used to execute certain hits (strokes),
loudness (dynamics) or color, or "texture", or simply speaking -- sound.

Yes, snare drum can make lots of sounds. If you don't believe, check out Steve Smith Modern Drummer
performance, when he talks about guys he sees in the drum store. He's also pretty surprised people
don't quite get the snare drum at all.

So yes -- the magic of playing snare drum is about executing sequences (combinations, if you prefer)
or drum strokes -- basically using your left and right hand to transfer power through motion of a
stick to the drum head surface, making it resonate, along with rebounding your stick (bouncing
power) to your hand.

Of course there's more to that -- Moeller technique, Gladstone technique, finger control, whipping
motions, rebound control, dynamics etc.. All important.

But still -- it's all about left, right, left, right.

The most important work in snare drum studies was done by, today world-recognized, giants of modern
drumming era. Well known names include George Gladstone, Stanford Moeller, and their students, Jim
Chapin and Joe Morello.

Fortunately for all of us, heritage has been passed in the form of books. I could right now perform
heavy Amazon-Ad-based advertising and earn millions, but I'll mention just one book -- "Stick
control" by George Lawrence Stone. This is a de facto standard, a bible, used by pretty much every
single teacher on the planet.

<iframe
src="http://rcm-na.amazon-adsystem.com/e/cm?lt1=_blank&bc1=FFFFFF&IS2=1&npa=1&bg1=FFFFFF&fc1=000000&lc1=FF0000&t=wkoszek-20&o=1&p=8&l=as4&m=amazon&f=ifr&ref=ss_til&asins=1892764040"
style="width:120px;height:240px;" scrolling="no" marginwidth="0"
marginheight="0" frameborder="0"></iframe>
When I first about it, I believed it's one of the rocket-science-alike music books with advanced
notation, which even Berklee students have problems understanding (for
example, I have a problem understanding
<a href="http://www.amazon.com/gp/product/0757995403/ref=as_li_ss_tl?ie=UTF8&tag=wkoszek-20&linkCode=as2&camp=1789&creative=390957&creativeASIN=0757995403">Advanced
Techniques For The Modern Drummer: Coordinating Independence As Applied To
Jazz And Be-bop With Cd (audio) (Vol. 1)</a><img
src="http://www.assoc-amazon.com/e/ir?t=wkoszek-20&l=as2&o=1&a=0757995403"
width="1" height="1" border="0" alt="" style="border:none !important;
margin:0px !important;" />).

But not. This book is a bit different. Literally, it's all about Boolean Algebra. While L is left
hand, and R is right hand, single stroke is given:

	L R L R L R L R

This is a single stroke roll, precisely speaking. Basis of everything in drums. Used everywhere, by
anyone. The most natural beat.  3-year old with a pair of sticks is likely to try this beat out of
the first thing he'll play.

	L L R R L L R R

Double stroke roll. This is a basis of everything with rebound, and when executed correctly, sound
of double-stroke roll kills.

There's 72 combinations like that, with 2 bars of each combination. Some 2-bar sets have the same pattern
repeated twice:

	L R L R L R L L		L R L R L R L L

But some are different:

	L R L R L L L L		R L R L R R R R

If you did anything with computers, suddenly you'll realize these are ... bits!  So now lets replace L
with 0 and R with 1:

	0 1 0 1 0 1 0 1

And double stroke roll:

	0 0 1 1 0 0 1 1

Now you get the idea! When I started to think about it, it seemed to be
pretty trivial. And it is, really. I believed that Stone was just a good
student on math classes and maybe learned Boolean Algebra. And I believed 72
exercises for single-stroke rolls are just bit combinations, which would
give me:

	72/256 ~= 28%

Right after I came up with an analogy between strokes and bits, I thought:

	Wow, with few lines of code I could have all combinations like that!

However, once you go with simple:

		for b = 0 to b == 0xff {
			print b in binary format
			maybe print b repeated twice
		}

You'll quickly understand that sequences in the book aren't just bits from a counter. If you pick
the book, and try to play over several bars, you understand some exercised are against your natural
muscle memory:

	L R L R  R L R L	L R L R  R L R L

Or:

	L L P P L P L L		P P L L P L P P

(This builds pretty interesting feeling of being symmetric and synchronous and helping you to do
every single bit in the drum set technique)

I played with several ideas for pattern generation. Quick hack with bits to
just get the feeling of what's going on:

	#include <stdio.h>

	int
	main(int argc, char **argv)
	{
		int	bar, c, i, l, p, w, mask, bitl, shift, pn, ln;

		(void)argc;
		(void)argv;

		for (w = 1; w <= 2; w++) {
			mask = (1<<4*w) - 1;
			shift = 4 * w;
			bitl = (8 * w) - 1;
			for (l = 0; l <= mask; l++) {
				p = (~l) & mask;
				bar = (l << shift) | p;
				pn = ln = 0;
				for (i = bitl; i >= 0; i--) {
					if ((1 << i) & bar) {
						c = 'P';
						pn++;
					} else {
						c = 'L';
						ln++;
					}
					if ((i+1) % 4 == 0) {
						putchar(' ');
					}
					putchar(c);
				}
				printf(" Pn:%d Ln:%d\n", pn, ln);
			}
		}
	}

Proven ANSI C is bad tool, since bit stuff is painful.

Program is based on a simple idea of figuring out a pattern of given length
`bitl`. For each length of that kind, we create two parts of patterns: `l`
which goes on the left, and `p` which goes on the right. The relationship of
them is that `p` is `l` with all bits inverted. These two glued together
create a bar `bar`. But lets leave this stuff for now, move to something
I'll be using in my next studies in analogies between bits and drum strokes
-- Verilog. It is nicer, since it has built-in `%b` format specifier and
lots of built-in syntax structures for bit banging:

	  1 module beats();
	  2 reg[3:0]        left_r = 4'd0;
	  3 reg[3:0]        right_r = 4'd0;
	  4 wire[7:0]       bar;
	  5 wire[15:0]      barx2;
	  6
	  7 integer         i;
	  8
	  9 initial begin
	 10         for (i = 0; i < 4'hf; i = i + 1) begin
	 11                 left_r[3:0] = i;
	 12                 right_r[3:0] = ~left_r;
	 13                 $display("%d: %b %b", i, bar, barx2);
	 14         end
	 15 end
	 16 assign bar[7:0] = { left_r[3:0], right_r[3:0] };
	 17 assign barx2[15:0] = { left_r[3:0], right_r[3:0], left_r[3:0], right_r[3:0] };
	 18
	 19 endmodule

Which gives us:

          0: 00001111 0000111100001111
          1: 00011110 0001111000011110
          2: 00101101 0010110100101101
          3: 00111100 0011110000111100
          4: 01001011 0100101101001011
          5: 01011010 0101101001011010
          6: 01101001 0110100101101001
          7: 01111000 0111100001111000
          8: 10000111 1000011110000111
          9: 10010110 1001011010010110
         10: 10100101 1010010110100101
         11: 10110100 1011010010110100
         12: 11000011 1100001111000011
         13: 11010010 1101001011010010
         14: 11100001 1110000111100001
Anyway, funny thing is that it has given me some pretty successful results:
0, 2, 3, 4, 5, 6, 9, 10, 11, 13, 14.  11 from 14 of those are well known
"rudiments" from Stick Control. But this example has symmetric patterns:
patterns starting from the left or right hand, which happen to be the same
later. In other words:

	3:  L L R R R R L L
	12: R R L L L L R R

Are symmetric. But this is not necessary to be counted. Why? Because playing
Ls and Rs means mapping them to the time slices.  Think about:

	assign { one, two, three, four } = { left[3:0] };

So you count "one", "two", "three", "four" in the measure of time, and you
execute a stroke. What's pretty impressive in drum rolls (patterns)
is that if you play (3), it may seem like you're actually incorporating (12)
too. It's not true. Your brain notices a difference, since it subconsciously
keeps the mapping of time slices to hands. So suddenly when *one* was L, it
may be R now, and it causes problems.

I used nibbles, since idea behind Stick Control is to practice both hands
evenly -- same number or L and R in the pattern.

I think that's all for now. I'll continue to think about it. Basically I'd
like to try doing the same with 8 beat patters and figuring out which ones
the ones I like - the ones that force my brain to work; the ones that make
me stop at play at tempos 60-80 to get it right, because of brain telling me
"Left", where "Right" was supposed to be used.

Lots of fun.
