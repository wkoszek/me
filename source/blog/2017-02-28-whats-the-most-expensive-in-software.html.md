---
title: "What's the most expensive in software?"
author: "Wojciech Adam Koszek"
description: >
  In this article I explain where the real cost of software
  comes from and what does it have to do with Joint Strike Fighter.
address: "Menlo Park, CA"
tags:
- "software engineering"
published: true
image: http://www.koszek.com/img/2017-02-28-whats-the-most-expensive-in-software/pandu-agus-wismoyo-196366_10p.jpg
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
Its lifespan will probably look like this:

|--------------------------------
| Month&nbsp;&nbsp;&nbsp; | Stage | Cost
|:---|:---------|:------
| Jan, '17| Idea | 1
| Feb, '17| Design | 1
| Mar, '17| Planning | 1
| Apr, '17| Development | 2
| May, '17| Development | 2
| Jun, '17| Deployment | 2
| Jul, '17| Maintenance | 1
| Aug, '17| Maintenance | 1
| Sep, '17| Maintenance | 1
| Oct, '17| Maintenance | 1
| Nov, '17| Maintenance | 1
| Dec, '17| Maintenance | 1
| Jan, '18| Development | 2
| Feb, '18| Maintenance | 1
| Mar, '18| Maintenance | 1
| Apr, '18| Maintenance | 1
| May, '18| Maintenance | 1
| Jun, '18| Maintenance | 1
| Jul, '18| Development | 2
| Aug, '18| Maintenance | 1
| Sep, '18| Maintenance | 1
| Oct, '18| Maintenance | 1
| Nov, '18| Maintenance | 1
| Dec, '18| Maintenance | 1
|===================================

If this cycle of maintenance is long enough, it can overweight the cost of
all previous stages. My guess is that with most of the software, this is the
case. We put a lot of effort upfront, make something that works, and then we
keep running it, patching bugs, enhancing it, patching bugs in these
enhancements, and so on. We do it forever. Or at least, for a very long time.
The [NetBSD](http://www.netbsd.org) and [FreeBSD](http://www.freebsd.org)
repositories you can see that people patch bugs which are fifteen year old.



In that sense software is a complete opposite to computer hardware. 
A supercomputer [can cost $100M](http://techland.time.com/2012/06/19/what-exactly-is-a-supercomputer/),
but energy to keep it alive is $10M/yr. You only run it for maybe three years, it becomes too slow and you
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
