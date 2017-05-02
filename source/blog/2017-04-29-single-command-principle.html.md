---
title: "Single Command Principle"
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

You should follow the **Single Command Principle** of software deployment.
A customer takes your software from the repository, looks at the `README`
file and sees a single command. A main entrance to the whole "software".

This command should either run your software with safe defaults, most common
configuration or something that shows that the run is successful.

It should bootstrap whatever is necessary on the client's computer too.
This is the experience you should strive for.

I call it a follow the "Single Command Principle" rule in your software
deployment methodology.
It's important, because people easily give up while trying to bootstrap
solutions that work. I wrote about this
[earlier](https://www.koszek.com/blog/2015/08/26/how-do-you-evaluate-new-technologies/).

## Background

In ["Don't document. Automate"][https://www.koszek.com/blog/2016/04/11/dont-document-automate/]
I talked about the importance of
automating steps for your workflow. Here I want to push it further: make the
most common flow available with a *single command*. **Impossible?**

It's hard. I admit. If writing a tutorial or a good `README` is one on the
scale of difficulty, then writing a fully automated solution is 3x the
effort.

But it's worth it. I'll quite likely pick a solution that just works over
the one that is better, since most of the time it doesn't really matter
(it'd have to be 3x better, faster, more secure etc.., and "competition"
rarely is *that* different)

## How I read documentation

When I'm building software, I'm mostly hearing in my head voices of people
whom I've worked with and who made an impression on me. I also hear my own
inner voice. During figuring out how to build and deploy a bigger chunk of
software I'm not familiar with, it's typically:

"Just give me the darn command to run."

"I don't want your documentation or explanations. I don't want your manual pages.
Just let me run the damn thing."

"Maybe it'll work, and if it does, I'll just tweak it a little or not at
all, if it works"

"Please, don't make me select and paste these random commands I have little idea
about. Just give me a recipe to try this damn thing out"

As you see I'm a big fan of Plug an Pray model, or OSX DMG model.

# Safe defaults

When you build software, we see all the problems and parameters. Stupid
example: when you build a real estate program, you can guess the most common
case of usage. Like: how many
buildings will be in a database, and how many appartments will be referenced
through the index and all other possible implications.

If you write an end product, it's easier. It's harder if you build
infrastructure, and it can handle anything from 1 to 1B of items. But these
cases aren't that common.

Just pick the most common configuration, call it "default" and make sure it works out
of the box.

**Make common case fast**

## Deployment

Use virtualization and separation for deploying with 1 command. It's the
easiest and best way to deliver any piece of software. Vagrant or Docker for
desktop/development software and tools.  There isn't anything easier that
`git clone ...` and a single `vagrant up` executed in a directory.

Second choice would be native package managers. For
example, if I run Ubuntu, doing `apt-get` with your package name is the
easiest for me. If you've packaged your software correctly, not only it'll
get installed, but also wrappers like `systemd` startups scripts. This is
very convenient and I like it, since it fits into my system model nicely.

Otherwise I need to write these boring pieces, which I don't like.

## Continuous integration

Whatever you do, wire it in the continuous integration system.
If it's Travis, I'd expect it to maybe have 3 commands at most.
Anything more means your customer will be typing or copy and pasting a lot
of stuff, which is always bad. Make it very short.

## Summary

Make it work out of the box, preferably with one command. Document the
tuning system, not installation system. The less tunables and mandatory
changes or adjustments, the better.

Take one of your projects and see how much it'd take to accomplish "Single
Command Principle" there. Let me know how it went.
