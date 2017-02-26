---
title:	"Don't document. Automate!"
author: "Wojciech Adam Koszek"
description: >
  Have you ever wondered why people who write great posts and figure complex
  flows out don't make it easier for others? In this piece I explain what my
  take on it is.
address: "Menlo Park, CA"
tags:
- "software engineering"
read:	2016-04-11
published: true
image: https://c1.staticflickr.com/9/8332/8120096647_b65df3d4c7.jpg
ads:
- 
spellcheck-allow:
- "OSX"
---

When I go to an article or a GitHub page it sometimes amazes me how good
stuff people produce. I'm building an sensor platform recently, and a lot of
problems I solve by using software others wrote and made it free. This
is great. But there's one pattern which I need to criticize: people write
way to much.

What do I mean by that?

The normal flow of getting software to work is typing a series of steps. For
example it may require typing 10 commands in the command line. And these
commands for ninety five percent of people will likely be the same.
For the rest 10% they'll be
slightly customized, but not much. Nothing that couldn't be achieved with
10-line shell script consuming 1-2 parameters.

But people don't do that. They prefer to write elaborate documentation
instead. And then I need to go and re-type everything with some silly
changes. I still feel grateful for seeing the correct steps, but this makes
little sense, wastes my time and I don't like it.

Here's a bad example on my part: my [Synology HOWTO][1] You can see what I
mean: the tools I've made are useful, and yes, you'll end up with a decent
solution for usable NAS system, but to get there, there's some drama on your
side for re-pasting all these steps.

What can we do instead?

Automate. Automate every flow you've figured out for yourself and others. If
you've spent 15 minutes on making set of commands work, spend 15 minutes
more and automate. Here is a little set of rules I made for myself:

- if it's a programming project of any kind, wrap it in `make` or whatever
  other build tool you use (`rake`, `cmake` etc.)
- if it's a UNIX or OSX project: write a `.sh` script for it.
- if it's Windows, write `.bat` script.
- if there's a chance script must be run remotely, wrap it in Ansible.

I try to follow these for all [of my projects][2]. To give you some
examples, in the last several months I've automated most of my complex
flows. Some of them:

- Gem release flow for my OSX build tool MacB: `makefile`
- Build/release process for my iOS app: [build.sh][3]
- My [middleman][4] based homepage: [makefile][5]
- Build steps for my DFA simulator: [build.bat][6]

The very important advantage of these flows is that I see they work, since I
can go and wire them to [Travis CI][7] or [AppVeyor][8] and the green badge
in my repositories will give me and others vote of confidence.

Improving and automating my flows is on my TODO. Are all your workflows
automated?

[1]:	https://github.com/wkoszek/synology
[2]:	https://github.com/wkoszek
[3]:	https://github.com/wkoszek/sensorama-ios/blob/master/build.sh
[4]:	https://middlemanapp.com/
[5]:	https://github.com/wkoszek/me/blob/master/makefile
[6]:	https://github.com/wkoszek/flviz/blob/master/build.bat
[7]:	https://travis-ci.org/
[8]:	https://www.appveyor.com/
