---
title: "Why you should start programming on UNIX"
author: "Wojciech Adam Koszek"
description: >
  People sometimes asked me how to start programming, and many of them
  get a wrong advice about web programming, webapps etc. In here I share my
  opinion of what I believe is the right path to start building software.
address: "Menlo Park, CA"
tags:
- "software engineering"
published: true
image: http://www.koszek.com/img/2017-01-28-why-you-should-start-programming-on-unix/unix_75p.jpg
ads:
-
spellcheck-allow:
---

It's simpler than anything else around.

I know. It's counterintuitive. All the nice tools and integrated
environments for writing code looks slick. You may even see other people
using them in the train to work.

You look over their shoulder and it doesn't look that hard.

But it is.

So stay with me hear and listen. The idea might be counterintuitive, but if
you go with it, I think you'll learn programming faster and you'll be a
better engineer at the end, since you'll do more things by yourself.

In my opinion your software adventure you should start from programming
UNIX, or GNU/Linux, in the modern newspeak.

Why?

It's 3x as simple to interact with UNIX that it is with modern Web. If you
set a goal to write a modern web app (something that many people laught at)
you're destined to be doomed, and you fight the forces of darkness. You dive
in a sea of Javascript libraries, Ruby or Django modules and plugins and try
to get your ORM model executing fast. And then it all is super clunky and
sometimes does work, but not quite. It hard to write a modern web app
nowadays, as it involves a lot of stuff: frontend, backend, a bit of devops
and it's all there to scare you.

UNIX has 1 black terminal window. You'll have a file. Maybe two or three.
And you'll have your text editor--whichever you want. Your whole project is
these 3 files, without any XML "project" files and any other crap. The last
thing of your environment is the compiler or the interpreter that you feed
your source code files with. It's very friendly unless you feed it a wrong
stuff, in which case it'll warn you.

UNIX was probably the first very well engineered OS. It hasn't changed that
much over the last 40 years. You can still pull old programs and understand
what they were supposed to do. You may even compile them.

UNIX API is great. I can remember every function there is, and
can write it from memory, most of the time. It is maybe 200 functions,
which if you read something like UNIX deamon source code, you can pretty
much understand.

To compare this: iOS API has 80 *framework*. And framework is basically API
subset, sometimes very complex. Of course not all apps use every framework,
but even using 5 of them means a lot of reading.

So next time you hear someone trying to persuade you to start programming
from the web, don't listen to them. Just listen a terminal window on your
computer and keep writing code and learning new stuff there. There'll be a
time where you'll understand a bit more about files, sockets, networking and
other operating system primitives, and you'll be able to grasp the stack for
modern web. But it's not the best idea if you're getting started with
programming. There's just too much stuff for you to filter through, in my
opinion.

Let me know how it goes.

![unix](/img/2017-01-28-why-you-should-start-programming-on-unix/unix_75p.jpg "unix")
