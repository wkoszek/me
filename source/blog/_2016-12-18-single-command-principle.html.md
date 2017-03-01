---
title: "How to deliver a high-quality software with a single command"
author: "Wojciech Adam Koszek"
description: >
  Make functional and reliable scripts with usable interface, and you have
  a high chance of gaining fast user adoption. Let's talk how to do it,
  targeting a command line scripts.
address: "Menlo Park, CA"
tags:
- "devops"
published: true
image: 
ads:
-
spellcheck-allow:
---

You should follow the "Single Command Principle" rule in your software. Your
customer takes your software from the repository, looks at directory listing and
runs one command. 
Command so descriptive you can't miss it. Make it
"runit.sh" or whatever else you want. If it's there, I'll likely notice it
and maybe it'll all just work.
The "customer" can be your boss, or one of your coworkers. Doesn't matter;
your effort will be greatly appreciated and you'll score a point in their
spreadsheet.  Let's explore this idea here.

## Background

In ["Don't document. Automate"][] I talked about the importance of
automating steps for your workflow. Here I want to push it further: make the
most common flow available with a *single command*. **Impossible?**

When you build software, we see all the problems and parameters. When you
build a real estate program, for example, you wonder how many buildings will
be in your database, how big will they be, and other details. Then you
wonder how many people will access the program, how much memory and CPUs you
have. Pick something reasonable, and just make it the default. Most of the
users will get it to work, and if they feel defaults are wrong, adjust it.
Everybody will appreciate it. **Impossible?**

"How to make it all work from a single command?", you may ask. And my answer
to you: use common sense and "common case fast". The reason is that as a
busy person, I really want to get down to my work and finish it quickly.
When I can't even test-drive your thing. Well. I'm sorry, but I'll use
something else. **Impossible?**

## Software delivery

Fred Brooks phrased his opinion on software development difficulty as
something like this table:

|----------------------
| Difficulty | Software class
|:---------|:---------------
| Easy | Applications
| Medium | Compilers
| Hard | Operating&nbsp;Systems
|===================================

<small>
(if I could add fourth row, I'd add systems engineering, where all three
pieces are developed in parallel)
</small>

When I was a FreeBSD developer the idea of modifying the kernel code which
x86, x86-64, MIPS, ARM and PowerPC was sharing was interesting. Some changes
I could only compile test, since I didn't have the hardware.  Development is
just a portion of the cost, however. There's also a software delivery.

Delivery commonly phrased as deployment happens when you want to give the
software to the customer, the devops team or your production server.
For simple service you can do it by yourself.
Big corporations have teams
dedicated just to shipping software; being able to monitor, alert,
recover and revert the software is a lot of work in a big company.

## Deployment difficulty

I want to coin the idea of deployment difficulty here, and suggest to use
this table:

|------------------
| Difficulty | Software class
|:---|:---------------
| Easy | Application, your OS only
| Medium | Networking service, your OS only
| Hard | Web service, remote machine
|===================================

"Easy" is achieved mostly thanks to `make` command for most of the C++ and C
software packages. Its two sisters are "configure" and "make install".
It's pretty easy to achieve that, so I won't cover this here. 


## Continuous integration

The concept of 
Where the concept of using the single command 


I'm done with abstact part of this 

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

["Don't document. Automate"]: https://www.koszek.com/blog/2016/04/11/dont-document-automate/
