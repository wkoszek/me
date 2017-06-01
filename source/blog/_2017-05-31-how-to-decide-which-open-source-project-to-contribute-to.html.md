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
image: 
ads:
-
spellcheck-allow:
---

Contributing to the Open Source makes sense. Most of the time. Let's talk about
projects which you should focus on, depending on your goals.

## Real-world software experience

You must find big, well-established software projects. They must have many people contributing.
The structure of the project must be figured out.
The whole ecosystem behind the project must look fairly serious.
Very often on the website of this project you'll see a name of the foundation slapped somewhere down to the bottom.

Here's the reasoning behind all of this: it must have signs of similarity between typical
commercial setting, where software engineers work for the company. You'll experience the same
benefits and the same frustrations as if it was your job. Examples of such problems are: responsible party 
doesn't like your code. Such person can be hard to get to, be busy, unwilling to help you, have issues
understanding you and your goals. These problems are present in everyday life in the life of the software
project, and if you manage to handle all of it, it'll be a good indicator on how you'll like working in a software
company.

## Expanding Computer Science/Engineering knowledge

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

## Getting recognition

To be able to get recognized in the Open Source community you'll have to stick
to one thing, possibly for extented period of time. We're talking years,
instead of months.  This will require patience, and being able to (1) attract
new users with your code [possibly making it solve their problem] and (2) being
able to communicate well.

Another idea is to get to the big project, figure out what the burning issues
are, and attempt to solve them. Another plus you get if this is something
boring or hard to do. Something other people aren't willing to tackle in their
free, unpaid time.  For example a large number of Open Source projects aren't
doing a great job at testing, so if you offer your hand in testing the code,
people will be thrilled.
