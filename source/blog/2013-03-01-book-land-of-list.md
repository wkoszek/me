---
title:	"Land of Lisp"
author: "Wojciech Adam Koszek"
address: "Menlo Park, CA"
auth:	Conrad Barski
read:	2013-03-01
tags:	books
layout: layout_book
ads:
- <iframe src="http://rcm-na.amazon-adsystem.com/e/cm?lt1=_blank&bc1=FFFFFF&IS2=1&npa=1&bg1=FFFFFF&fc1=000000&lc1=FF0000&t=wkoszek-20&o=1&p=8&l=as4&m=amazon&f=ifr&ref=ss_til&asins=1593272812" style="width:120px;height:240px;" scrolling="no" marginwidth="0" marginheight="0" frameborder="0"></iframe>
spellcheck-allow:
- "comparators"
- "Lua"
- "bytecode"
- "OMG"
- "ozonehouse"
- "Javascript"
- "Seibel"
- "LISPy"
- "Graham's"
---
Full title "Land of Lisp: Learn to Program in Lisp, One Game at a Time!"

Book is quite unique: written by MD.

This time I picked something that I've never had a chance to study, which is
LISP. Lots of storytelling is going on about impact of LISP on other
computer technologies.

I was inspired to look at LISP due to several reasons, but mostly because of
preaching of a friend of mine, who advised me to look at it, even from the
purely historical reasons. Another reason was "Hackers and Painters" and
Paul Graham's advertising of this technology. Mr McCarthy contributions too
were the motivating factor.

In LISP I'm seeing lots of ideas which I'm familiar with, and which I'm sure
came from LISP--each time I'll use Perl's "map" or "grep" or custom "sort"
comparators, I'll be thinking about LISP.

Power of using lists for pretty much every single language element gave a
nice perspective on what can be done with simplicity, and brought good
memories of hacking Lua (I made Lua work in FreeBSD's boot loader). Lua came
to mind, since Lua is heavily based on arrays (tables).

Another great advantage which I saw is the possibility of returning 2 values
(or rather: resolving to 2 values). This is something I greatly miss in C
and I'd pay at least $9.99 to IEEE if they could make:

	{ fd, error } = function("/path/to/file", O_OPERATION);

possible.

The whole concept of having data and code interleaved together bring Forth
to my memories. I wish I had more insight into how exactly compilation of
LISP to code/bytecode looks like and how the LISP internals were organized
in the early days. This I think I'll have to study from some other resource.

The thing that makes LISP be "OMG" technology is "loop" monster. Basically
it looks like you need a periodic table similar to Perl's operator table:

[http://www.ozonehouse.com/mark/periodic/](http://www.ozonehouse.com/mark/periodic/)

To be able to understand the whole thing.

The concept of functional programming I knew before due to classes in Java
and my experience with Javascript. However in case of LISP we're talking
about functional programming pushed to a higher order than it's present in
the other 2 technologies.

The thing that is surprising me is that LISP hasn't been picked as the
technology for WWW programming. I only see advantages of:

	(html
		(body
			(b "Sample HTML table")
			(table
				(th (list "num" "column1" "column2"))
				(td (lisp "1", "sth1", "sth1"))
				(td (lisp "2", "sth2", "sth2"))
				(td (lisp "3", "sth3", "sth3"))
			)
		)
	)

Thing, that I properly validate, before publishing. Something, that could
have code and presentation mixed up, since otherwise it gets messy. Each
time I'm looking at modern WWW technologies, no matter how great, it looks
like it's still all about taking content in a completely different format
and mixing it with totally different code. This is ridiculous.

For completeness of my studies, I'm thinking about picking "ANSI Common
LISP" by Paul Graham or Practical Common LISP by Peter Seibel, to be able to
understand more about practical implications.

The thing I see already is that LISPy syntax isn't too appealing to me, and
productivity with all these brackets isn't the highest.

However, for a completeness of your programming knowledge, I can highly
recommend "Land of LISP".
