---
title: "Single Command Principle, and how to follow it"
author: "Wojciech Adam Koszek"
description: >
  Make functional and reliable software with usable interface, and you have
  a high chance of gaining fast user adoption. Let's talk how to do it,
  targetting a specialized field of batch processing: command line execution
  and automation scripts.
address: "Menlo Park, CA"
tags:
- "devops"
published: true
image: 
ads:
-
spellcheck-allow:
---

Want it or not, a large portion of the professional software developer flow
happens in the command line.

  Your software and automation scripts must be easy to use
  to be really successful. We discuss how to make 
  I discuss the background behind how I work with the
  command line interfaces for complex systems tasks. Hints I show can speed
  up your daily tasks in the command line.

Just give me the darn command to run.
I don't want your documentation or explanations.
I don't want your manual pages.
Just let me run the damn thing.
Yes, it's very insecure, but I can open it in Vim, look through it and if
it looks reasonable, I'll just execute it.
I will go, retype or repaste the damn command, and guess what?
With all the exploits that hide and are there to jump on me.
Repaste.
And afterwards I'll just hit ENTER.
Just like that.
Little, silly, careless ENTER.
Click.
ENTER pressed.
Pum.
No way back.

In ["Don't document. Automate"][] I talked about the importance of automating
steps for your workflow. Boring process should be automated as early as
possible,

Heck, even Microsoft adopted all possible commmand-line interfaces.
Why? Well, it's a known truth that automating GUI is hard. If one window pops
up in the center, then we send 1 and press Enter, and then another window
shows up, we press X+CTRL and send ENTER. The problem comes up when your
system upgrade popup dialog shows up, the mouse pointer and keyboard cursor
get focuces on the new window, and your automation starts sending stuff to a
unknown application.

