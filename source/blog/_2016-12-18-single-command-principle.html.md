---
title: "How to make your software better with Single Command Principle"
author: "Wojciech Adam Koszek"
description: >
  Make functional and reliable scripts with usable interface, and you have
  a high chance of gaining fast user adoption. Let's talk how to do it,
  targetting a command line scripts.
address: "Menlo Park, CA"
tags:
- "devops"
published: true
image: 
ads:
-
spellcheck-allow:
---

I want to coin an idea here. I called it a "Single Command Principle", the
idea that would let a new user execute your software with a single command.
Assume you make "./run.sh" command which would do all the magic.
This command would take care of your 

In ["Don't document. Automate"][] I talked about the importance of automating
steps for your workflow.
Here I want to push it further: make the most
common flow be available with a single command.

When we build software, we see all the problems and parameters. Sometimes 
Boring process should be automated as early as possible.

How do I know?

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
