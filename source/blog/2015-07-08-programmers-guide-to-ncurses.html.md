---
title:	'Source Code from "Programmer Guide to NCurses" by Dan Gookin'
author: "Wojciech Adam Koszek"
_layout: post
description: >
  Dan Gookin did a good job with getting some NCurses examples out in the
  world, and I've just made it easier to access. If you like to write your
  own, little crude tools, and do all of this in C, this is a good resource.
address: "Menlo Park, CA"
tags:
- "software engineering"
- "programming"
read:	2015-07-08
published: true
ads:
- <a href="http://www.amazon.com/gp/product/0470107596/ref=as_li_tl?ie=UTF8&camp=1789&creative=390957&creativeASIN=0470107596&linkCode=as2&tag=wkoszek-20&linkId=MGOJX6VUG7MNU4C5"><img border="0" src="http://ws-na.amazon-adsystem.com/widgets/q?_encoding=UTF8&ASIN=0470107596&Format=_SL250_&ID=AsinImage&MarketPlace=US&ServiceVersion=20070822&WS=1&tag=wkoszek-20" ></a><img src="http://ir-na.amazon-adsystem.com/e/ir?t=wkoszek-20&l=as2&o=1&a=0470107596" width="1" height="1" border="0" alt="" style="border:none !important; margin:0px !important;" />
spellcheck-allow:
- "Gookin's"
- "makefile"
- "GCC"
---

Even though I've never read Gookin's book, I've noticed that his website
tarball with C sources is quite useful, as it contains small self-contained
programs. To the sources I've added a `makefile` to make build automated and
I've fixed programs which weren't compiling.

## Dependencies

For MacOSX I didn't need anything. For Ubuntu you'll probably have to type:

~~~terminal
apt-get install libncurses5-dev libncurses5
~~~

## How to build?

Fetch the source, enter its folder and type make:

~~~terminal
git clone https://github.com/wkoszek/ncurses_guide.git
cd ncurses_guide
./build.sh
~~~

The result of this will be in `book/` and `book-ref/` directories with `.prog`
programs, each one corresponding to its `.c` file.

To clean-up, run:

~~~terminal
./build.sh clean
~~~

## How it's tested?

The project is wired to Travis-Ci service:

[![Build Status](https://travis-ci.org/wkoszek/ncurses_guide.svg?branch=master)](https://travis-ci.org/wkoszek/ncurses_guide)

Everything is compiled with 2 compilers: GCC and Clang and as of now
compiles with no warnings.
