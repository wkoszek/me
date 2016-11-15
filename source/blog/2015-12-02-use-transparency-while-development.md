---
title:	'How I use transparency during development'
author: "Wojciech Adam Koszek"
abstract: >
  Short hint on how transparency in Terminal can be useful while working
  on web stuff.
address: "Menlo Park, CA"
tags:
- article
read:	2015-12-02
published: true
layout:	layout_book
ads:
- 
image: http://www.koszek.com/img/2015-12-02-use-transparency-while-development/image01.png
spellcheck-allow:
- "MacBook"
- "livereload"
- "Livereload"
---



The 13” MacBook Air isn’t a perfect development environment, yet I still
need to do some work done outside of the house. I’ve been experimenting
around and that’s what I’ve came up with:

![](2015-12-02-use-transparency-while-development/image01.png)

In the background you have a Web browser with
[middleman-livereload](https://github.com/middleman/middleman-livereload).
Each time I make a small source code change in Vim and save a file, the
live-reload updates the site in the background. We could call it
“real-time”. The advantage of this method is that you can use it without
any special configuration: default Terminal in MacOSX or Xterm client
being able to display transparency will work. And you must have some
environment for web development where
[Livereload](http://livereload.com/) works. Transparency I have isn’t
shown percentage-wise, but it’s set to around ⅓:

![](2015-12-02-use-transparency-while-development/image03.png)

I’d like to hear how you deal with web editing with smaller screen
real-estate.
