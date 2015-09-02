---
title:	'(Probably) the single biggest collection of Ruby scripts'
tags:	article
read:	2015-09-01
published: true
layout:	layout_book
ads:
- <a href="http://www.amazon.com/gp/product/1937785491/ref=as_li_tl?ie=UTF8&camp=1789&creative=390957&creativeASIN=1937785491&linkCode=as2&tag=wojcadamkoszh-20&linkId=PHNJA5PM4PDXU2BF"><img border="0" src="http://ws-na.amazon-adsystem.com/widgets/q?_encoding=UTF8&ASIN=1937785491&Format=_SL250_&ID=AsinImage&MarketPlace=US&ServiceVersion=20070822&WS=1&tag=wojcadamkoszh-20" ></a><img src="http://ir-na.amazon-adsystem.com/e/ir?t=wojcadamkoszh-20&l=as2&o=1&a=1937785491" width="1" height="1" border="0" alt="" style="border:none !important; margin:0px !important;" />

---

## Quickstart

[https://github.com/wkoszek/book-programming-ruby](https://github.com/wkoszek/book-programming-ruby)

## Explanation

To evaluate the feasibility of different Ruby interpreters I wanted to
investigate how any of Ruby 1.8, 1.9, 2.x and Rubinius will deal with
subsets of scripts fed to them. I did it because I've noticed
[regressions with Rubinius](https://github.com/rubinius/rubinius/issues/3456)
in the past, and I wanted to understand whether this situation is similar for a
larger code base and basically how serious these issues are.

On the separate now, for learning Ruby I used couple of books, and one of
them was:

<a href="http://www.amazon.com/gp/product/1937785491/ref=as_li_tl?ie=UTF8&camp=1789&creative=390957&creativeASIN=1937785491&linkCode=as2&tag=wojcadamkoszh-20&linkId=PHNJA5PM4PDXU2BF">Programming Ruby: The Pragmatic Programmers' Guide</a><img src="http://ir-na.amazon-adsystem.com/e/ir?t=wojcadamkoszh-20&l=as2&o=1&a=1937785491" width="1" height="1" border="0" alt="" style="border:none !important; margin:0px !important;" />

What I didn't know earlier is that this book comes with a collection of
1600+ scripts ready to be tried out. During my trip to Chicago I had periods
with no Internet connectivity, and this archive proved to be very useful for using
`grep(1)` too.

I decided to merge the two needs of mine, and so I decided to add some life
to this archive.

The code in https://github.com/wkoszek/book-programming-ruby is basically a
`src/` directory from the book dressed with simple make-based infrastructure
I wrote. It works in 2 modes: syntax checking or run. In syntax checking
mode, we make sure Ruby scripts run without interpreter issues. For run
mode, we actually execute the scripts on the host. All scripts I feed with
some data on standard input. Scripts which require that end up getting
expected data. Scripts that don't require data on the input run without
side-effects. My `makefile` is intentionally running in "skip error" mode
(minus `-` preceding the recipe line), so that we can see number and types
of errors.

On top of that I have a simple script which generates a simple report. It
counts total number of tests, tests executed and the ones which resulted in
an error.

Better way would be to generate a JSON file after each run and later plot
the results on the website. But I think this archive might be useful as it
is right now too, so I decided to publish it.

The code is here:

[https://github.com/wkoszek/book-programming-ruby](https://github.com/wkoszek/book-programming-ruby)

Suggestions? Would love to hear them.
