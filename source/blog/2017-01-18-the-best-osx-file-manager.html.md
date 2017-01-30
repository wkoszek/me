---
title: "The best OSX file manager"
author: "Wojciech Adam Koszek"
description: >
  Shuffling files on OSX doesn't have to be hard if you have the right
  tool. I show you the motivation behind the research on file managers I've
  done and show you my favorite tool.
address: "Menlo Park, CA"
tags:
- "tools"
published: true
image: 
ads:
-
spellcheck-allow:
---

Even if you don't like Windows, some tools there were great. One of them was
[WinAmp][], probably the best audio player around. (do you know a replacement
for OSX? Let me know!)

Another was [Total Commander][]--the 2 pane file commander. Total Commander
could do anything you could think of for file management.
Its UI was like [Norton Commander][]'s: the
"blue background" file manager for DOS.

You miss a bit if you don't use these tools, since they're huge time savers.
There isn't similar functionality built in the OSX, so you'll have to do
your homework. You can use Finder, of course, and I do like Finder and it's
preview feature. Also the the embedded image editor is very useful. However
for shuffling files Finder is terrible. You must play with tabs, select
files which somes get unselected. You select many files and want to move it
to the directory on the very bottom of the current screen? Good luck. For
file-system management, Finder sucks. You must admit it.

So I started from [the page on file managers][] on Wikipedia, and learned
about Orthodox File Managers".

The idea is that on the left you have one directory, on the right you have
another one, and you have a set of shortcuts for moving files back and
forth. You can copy, move, rename, delete files. In a good manager the
source/destination can be anything: another folder, another computer in the
network, a website server etc.

So what's there for OSX?

[This is a great thread][] on StackOverflow on really good file managers for OSX.

I've tried some of this stuff, but [muCommander][] beat them all. Others
were paid and not looking very good.

muCommander looks simple, but is pretty powerful.

![MuCommander screenshot](/img/2017-01-18-the-best-osx-file-manager/mucommander_75p.jpg "MuCommander")

My mental model is: left pane is source, right pane is destination. It's
simple for files and directories, and comes handy when you make a backup to
your external harddrive (you do backup, don't you?)

It has a support for modern stuff too: S3, HDFS and HTTP:

![MuCommander screenshot 2](/img/2017-01-18-the-best-osx-file-manager/mucommander_functions_75p.jpg "MuCommander 2")

If you're a normal user and you only care about files, it won't be fun for
you, but nerds should try "HTTP". You can type a website address there and
muCommander will fetch and analyze the site and show its resources as files.
So if there's a reference to `style.css` it'll show it to you and you can
copy the file to the local filesystem. It's pretty cool.

You should start playing with it and I think you'll like it.

[This is a great thread]: http://apple.stackexchange.com/questions/10097/what-orthodox-file-manager-for-os-x-could-i-use
[WinAmp]: http://www.winamp.com
[Total Commander]: https://www.ghisler.com
[Norton Commander]: https://en.wikipedia.org/wiki/Norton_Commander
[the page on file managers]: https://en.wikipedia.org/wiki/File_manager
[muCommander]: http://www.mucommander.com
