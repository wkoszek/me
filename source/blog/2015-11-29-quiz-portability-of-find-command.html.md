---
title:	'Quiz: portability of “find” command'
author: "Wojciech Adam Koszek"
klayout: post
description: >
  Another portability issue when moving around the operating systems. How
  often do you use `find`? Exactly. Interesting for UNIX and macOS people.
address: "Menlo Park, CA"
tags:
- "tools"
read:	2015-11-29
published: true
ads:
- 
---

On MacOSX:

~~~shell
wk:/w/repos/dockerfiles&> find wkoszek -type d -depth 1
wkoszek/base
wkoszek/nginx
~~~

On Linux you get:

~~~shell
find: warning: you have specified the -depth option after a non-option
argument -type, but options are not positional (-depth affects tests
specified before it as well as those specified after it). Please specify
options before other arguments.
~~~

Hint: compare manual pages of both commands.

Quiz: do you know offhand what’s the correct fix?
