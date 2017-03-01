---
title: "What's the most expensive stage of software engineering?"
author: "Wojciech Adam Koszek"
description: >
  In this article I explain where the real cost of software
  comes from and what does it have to do with Joint Strike Fighter.
address: "Menlo Park, CA"
tags:
- "software engineering"
published: true
image: https://www.koszek.com/img/2017-02-28-whats-the-most-expensive-in-software/pandu-agus-wismoyo-196366_10p.jpg
ads:
-
spellcheck-allow:
-
---

![alt_text_0](/img/2017-02-28-whats-the-most-expensive-in-software/pandu-agus-wismoyo-196366_10p.jpg "worker")
<br>
<small><small><small>
*(Photo by [Yatesndu Agus Wismoyo](https://unsplash.com/@kangterbang) via [Unsplash](https://www.unsplash.com))*
</small></small></small>

Imagine we're starting a software project together this year.
It will run in production, and serve a large amount of live customer
traffic.
Its lifespan may look like this:

![alt_text_3](/img/2017-02-28-whats-the-most-expensive-stage-of-software-engineering/sw_graph_50p.jpg "Image_text_3")

If this cycle of maintenance is long enough, it can overweight the cost of
all previous stages. I [do have projects](https://travis-ci.org/wkoszek/)
which are considered "finished": all the features are there, and as much as
you can't make a hammer any better, neither can I any of these projects.
But for the most part, the software story is a little different: it'll
always be a recipe, but the kitchen, ingredients, pans or people will change over
time. These adjustments cost money.

My guess is that with the majority of production software, the graph from above is true.
We put a lot of effort upfront and make something that works well. And then we
keep running it, patching bugs, enhancing it, patching bugs in these
enhancements, and so on. We do it forever. Or at least, for a very long time.
People who wrote the code may not be around anymore, so you need to train
new people. [Not only NASA](http://www.popularmechanics.com/space/a17991/voyager-1-voyager-2-retiring-engineer/)
has this problem.

The [NetBSD](http://www.netbsd.org) and [FreeBSD](http://www.freebsd.org)
repositories you can see that people patch bugs which are fifteen year old.
How much money do you think it'd take to add a new feature in PostgresSQL?

In that sense software is a complete opposite to computer hardware. 
A supercomputer [can cost $100M](http://techland.time.com/2012/06/19/what-exactly-is-a-supercomputer/),
but energy to keep it alive is $10M a year. You only run it for maybe three years, it becomes too slow and you
decommission it. Supercomputer lifespan ruled by the aging of the silicon is
the same as your smartphone. Two years and we get bored.

> You should focus on optimizing maintenance

[Joint Stike Fighter](https://en.wikipedia.org/wiki/Lockheed_Martin_F-35_Lightning_II)
is close to what software maintenance is about.
The cost estimate for the JSF program is $1.508T dollars, where $379B is development. The
$1123B is maintenance.

![alt_text_5](/img/2017-02-28-whats-the-most-expensive-in-software/sw_main_75p.jpg "Image_text_5")

Life expectancy: till 2070.

Next time you stick five incoherent lines into your code with hopes that "we
will fix it later", imagine how "later" will feel like for someone who will
look at your code. Fifteen years from now. Or fifty.

### You may also like

* [Pull requests that merge](https://www.koszek.com/blog/2017/02/18/making-pull-requests-that-merge/)
* [Reading 101 for software engineers](https://www.koszek.com/blog/2017/01/17/reading-for-software-engineers/)
* [Use as few tools as possible](https://www.koszek.com/blog/2016/05/16/use-as-few-tools-as-possible/)
