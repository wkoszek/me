---
title:	'Quiz: portability of “find” command'
author: "Wojciech Adam Koszek"
abstract:
address: "Menlo Park, CA"
tags:	article
read:	2015-11-29
published: true
layout:	layout_book
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
