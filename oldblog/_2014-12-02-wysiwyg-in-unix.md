WYSIWYG in UNIX &mdash; or how I had Playgrounds before Apple did
------------------------------------------------------------------
**by Wojciech Koszek**
%%inc/addthis.html%%

UNIX is great most of the time as a desktop machine, until it's not. It's a
great set of tools, and systems such as Windows with its PowerShell are
starting to compete head-to-head. Where I feel Windows and MacOSX are way
ahead is in a set of WYSIWYG tools.

Each time I try WYSIWYG tool under UNIX to adjust a EPS, resize the image or
do something equally simple, I'm terribly disappointed. In terms of the real
user applications for multimedia, there's a lot of work to do.

In the last several weeks I've had a need to work with TeX, METAPOST and
InkScape, and each time I make an update to a project, I have a need to
refresh the image.

Now the story gets complex if your graphics needs to be loaded to the
browser. Even even more complex if the browser's connections must go through
the WWW proxy.

In this post I'll limit myself only to creating a comfortable development
environment for all sorts of work flow, where it would be really nice and
beneficial to have a WYSIWYG tool.

Editor binding
--------------

Let's start from how you actually craft the content. My normal day is spent
in VIM, and my magic sequence is called ``tt''

My ``tt'' means "invoke make(1) with its default target". My flow is
structured around having a directory files with files necessary for the
project which I'm actively working on, and since on my old Intel i5 laptop I
rarely find things I have to wait for, I don't have to worry too much about
what default rule in my ``Makefile'' is. I stick pretty much everything I
need to get regenerated there, and make(1) does all the hard work for me.

Browser
-------
I'm trying to work on the illustration for my article, and since it happens
to be fairly technical, I'm using METAPOST. METAPOST is run from the command
line and generates SVG and EPS from the .mp file. From within VIM I'm 

TeX
---

METAPOST
--------

