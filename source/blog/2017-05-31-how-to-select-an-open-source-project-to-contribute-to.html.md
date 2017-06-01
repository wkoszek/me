---
title: "How to select an Open Source project to contribute to"
author: "Wojciech Adam Koszek"
klayout: post
description: >
  Open Source isn't all equal. Contributing to wrong projects won't bring
  you many benefits, so deciding how you invest your time is important.
maillist: >
  In which I talked about how to go about choosing which Open Source projects
  are worth contributing to.
address: "Menlo Park, CA"
tags:
- "software engineering"
published: true
image: https://www.koszek.com/img/2017-05-31-how-to-select-an-open-source-project-to-contribute-to/markus-spiske-109588_10p.jpg 
ads: 
-
spellcheck-allow:
---

I don't remember which audiobook I heard it from, but the author stated we
all seek and are directed by four things: status, power, money, and
popularity.  Working on software is no different: people don't spend their
private time in front of the computer hacking code without a reason.

![alt_text_1](/img/2017-05-31-how-to-select-an-open-source-project-to-contribute-to/markus-spiske-109588_10p.jpg "Image_text_1")

You must like to get critique from people who read your code, since it
improves your skills.  After you bring changes and the people like them, it
brings all of your "ratios" higher too. Another example is when your
projects reach certain level on maturity and you get recognized by other
hackers (through GitHub stars) when they like the program you wrote or the
tool you've hacked. Personally I get a spike of motivation that way. It's
one of the things that keeps me going with [my Open Source](https://github.com/wkoszek).

My view is that it's positive--contributing to the Open Source makes sense,
after all. Most of the time. Here we will talk about projects which you
should focus on, depending on your goals. 

## Status: using Open Source to get a real-world experience

**Example:** [FreeBSD](https://www.freebsd.org/), [NetBSD](https://www.netbsd.org/), [OpenBSD](https://www.openbsd.org/), [Linux](https://www.kernel.org/), [GNOME](https://www.gnome.org/), [KDE](https://www.kde.org/), [NGINX](https://nginx.org/en/), [Apache](https://www.apache.org/)

![alt_text_5](/img/2017-05-31-how-to-select-an-open-source-project-to-contribute-to/Freebsd-logo_75p.jpg "Image_text_5")

For real-world experience, you must find big, well-established software
projects. They must have many people contributing.  The structure of the
project must be figured out.  The whole ecosystem behind the project must
look fairly serious.  Very often on the website of this project you'll see a
name of the foundation slapped somewhere down to the bottom.

Here's the reasoning behind all of this: it must have signs of similarity
between typical commercial setting, where software engineers work for the
company. You'll experience the same benefits and the same frustrations as if
it was your job. Examples of such problems are: responsible party doesn't
like your code. Such person can be hard to get to, be busy, unwilling to
help you, have issues understanding you and your goals. These problems are
present in everyday life in the life of the software project, and if you
manage to handle all of it, it'll be a good indicator on how you'll like
working in a software company.

## Power: expanding Computer Science/Engineering knowledge

**Example:** [FreeBSD](https://www.freebsd.org/), [Linux](https://www.kernel.org/), [Tensorflow](https://www.tensorflow.org/), [LLVM](http://llvm.org/), [Clang](https://clang.llvm.org/), [GCC](https://gcc.gnu.org/), [GDB](https://www.gnu.org/s/gdb/), [PostgresSQL](https://www.postgresql.org/)

![alt_text_18](/img/2017-05-31-how-to-select-an-open-source-project-to-contribute-to/PostgreSQL_logo_75p.jpg "Image_text_18")

For this you'll seek software that executes a lot. Sounds funny? Well, the
truth about "normal" everyday software is that however you write it, it's
likely to be fast enough. No optimizations, no special algorithms. Default
boring algorithms from the standard library of Python or Ruby will be fast
enough for 70% cases of your problems.  These 25% of cases are where going to
something like Go, Rust, C++ or finally C might be worth. For the cost of 3x of
software productivity you'll get something that is anything from 2x to 1000x
faster.

Finally comes something I'd call '5% software': compiler, interpreter or
operating systems code. Code executed hundreds times a second, always, for
every program you run on your machine. This is where you'll see fast
algorithms, multi-threaded code, a lot of performance hacks. Implementing those
here makes sense, since they'll save you hours of computing time, if you look
at it in 8hr/day perspective.

## Popularity: getting recognition through Open Source

**Example** any of the above, really..

To be able to get recognized in the Open Source community you'll have to stick
to one thing, possibly for extented period of time. We're talking years,
instead of months.  This will require patience, and being able to:

- attract new users with your code (possibly making it solve their problem) and
- being able to communicate well.

Another idea is to get to the big project, figure out what the burning issues
are, and attempt to solve them. Another plus you get if this is something
boring or hard to do. Something other people aren't willing to tackle in their
free, unpaid time.  For example a large number of Open Source projects aren't
doing a great job at testing, so if you offer your hand in testing the code,
people will be thrilled.

## Money: getting a job with Open Source

**Example** [ReactJS](https://facebook.github.io/react/) (FB), [Android](https://www.android.com/) (Google), [Ansible](https://www.ansible.com/) (Red Hat), etc.

In 2010 I've gotten a job because of a very little number of Open Source
contributions.  The thing is that other people who applied had none, as far
as I was informed.  Out of my commits which I could show, some of them were
commited to a bigger projects.  I guess it was enough to show I'm capable of
reading large chunks of code.

Sometimes just mere interest in Open Source could help, because many
companies didn't know how to handle Open Source software.

The yardstick may be higher for some companies though. Open Source infiltrated many
software houses after all, so
just showing couple of contributions to [Hadoop](http://hadoop.apache.org/) when you apply to Facebook
may not be enough. But there's another way...

Established software companies publish code. A lot of code. If I were an manager on a team
with some Open Source code published, my top priority during hiring would be
to reach out to my engineers and pick people who contributed to our GitHub
repositories.  Why?

People who sacrificed their private time to come to our GitHub repository,
read the code, try it out and maybe improve it definitely have some skill
and, more important, some interest in what my team does.

## Summary

Hacking software long-term is a lot of work, and it's nice to be concious
and aware how and why you channel your creative energy towards some things,
and not the others, and I hope this article was useful. Let me know if it
had influenced your decision in any way.
