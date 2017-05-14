---
title: "Making pull requests that merge"
author: "Wojciech Adam Koszek"
klayout: post
description: >
  Making progress in a software project means accumulating changes
  which align well with the its plan and vision. I explain how you can
  be more successful
  at your job when making code changes, and how to improve
  the quality of your pull requests.
address: "Menlo Park, CA"
tags:
- "productivity"
- "software engineering"
auth:	Wojciech Koszek
image: http://www.koszek.com/img/2017-02-18-making-pull-requests-that-merge/stephen-crowley-110321_15p.jpg
ads:
- 
---

The role of the software architect is to reject bad code, push back on
unnecessary features and prevent the project from accumulating cruft.
I use the term "software architect" here to match the professional
environment, but it can apply to any independent software developer,
including Open Source software engineers writing projects they love and talk
about.
When you make a change to the software source code, you will need to pass a
judgement of a software architect.
To bring your code into the project upstream, there are two angles
you'll be evaluated from: technical and social.

![alt_text_1](/img/2017-02-18-making-pull-requests-that-merge/stephen-crowley-110321_15p.jpg "Image_text_1")
<br>
<small><small><small>
*(Photo by [Stephen Crowley](https://unsplash.com/@crowleystephen) via [Unsplash](https://www.unsplash.com))*
</small></small></small>


Social angle isn't very complex, as we're talking
about communicating clearly with the project leaders, and explaining why you
want to make a code change. Sometimes it's clear and obvious, for example, when
you've made a bug fix. Paragraph or two should suffice to make your
intentions apparent. If you do this properly, and you're half done.

Technical angle is harder. Owners have their
point of view on a project, their ideas, and their plans, and you must
align yourself with all of them.

>  In the company you'll have these wishes and
>  work items broken down to tickets, so understanding whether you're aligned
>  is pretty easy. Are you working on a ticket? No? Well, you're not aligned. I
>  argue that contributing to software in the professional setting is easier.
>  In the Open Source world, we rarely have work items. We're fortunate we have
>  a wishlist.

Let's talk about this alignment here. During our discussion let's
assume you're attempting to bring from twenty to fifty lines of new code to my software
package. Without the change, the functionality you want isn't there. How do I
evaluate your change?

## Why does author of a change matter?

New change submission is a new notification e-mail to me.  Just
like for every letter in your mailbox, I look at the source.  Known people
get more attention and higher priority, and cold-calling attempts get less.
The latter happens rarely at work, within one team, and more often with
Open Source.
Subconciously I feel that dealing with an unknown person will be more work, so I
procrastinate. If the project is mine, handling this communication is
fine with me, because after all, well being of my software is my business.
I must handle code change requests promptly. For the Open Source software I
can say that if the contributor took the effort to make a pull request, it's
possible that the code change is fine. Maybe one percent of people do it.

> Note we can possibly talk about some bias here.  I'd love to see someone
> make an experiment, and remove contributors names whatsoever. You'd receive
> a request for code review, but without know who it is.

## Why keeping small size is important?

Numbers of lines you change is proportional to the time I need to
spend reviewing them. Change only the lines which are absolutely required.
I like very minimalistic changes, which do just one thing. It's
pretty easy to read your modification when you conform to this rule.
Remember the documentation and tests, and you're on your way to having me press
"Merge" button, and getting your code incorporated. Make no changes to style
in parallel with functional changes. **Never**. This makes the code review
very hard. I really care about size, because I make most of mistakes in my
software when I change too many lines at once, and I simply can't
effectively review my patches afterwards anymore.

## Importance of coding style

New code must follow existing style.
The reason is that
inconsistency makes the software hard to maintain, and the software
maintainance is the most expensive, as it lasts the longest. Do not make the
maintenance hard, ever, and the authors will appreciate you.

![alt_text_1](/img/2017-02-18-making-pull-requests-that-merge/markus-spiske-109588_10p.jpg "Image_text_1")
<br>
<small><small><small>
*(Photo by [Markus Spiske](https://unsplash.com/@markusspiske) via [Unsplash](https://www.unsplash.com))*
</small></small></small>

If you bring many lines with mismatched style, this would make project worse
as a result, and I can't bring your change it. Style to some extent can be
verified automatically, with an external tool, like `indent` for ANSI C, of
`gofmt` for Go Programming Language. It'll only catch formatting, but won't
help you with variable names or comments. You can read more about style
issues in [Code Complete][] and [Clean Code][].

Experienced engineers are pedantic about style, and so should you, if you
want to follow their ranks.

## Getting to actual change logic

Previous conditions I have explained in detail, but they may
translate to first ten seconds of work required. The next ninenty
nine percent will involve thinking through the your code.
Easy changes will take a minute or less: one or two `if` conditions added.
This is the type of change I'd receive for some of
[my hobby pet projects](http://github.com/wkoszek)
available over GitHub.
Complex changes can take me hours to analyze.

## Code coverage

It's very important that I see how you tested the code.
Better yet, I'd love to get a single command to reproduce your
results. First I'll check whether the change does what you say.
I will try to match the intention of your code (the social part) to the code
(technical part).

Well-managed projects will use
[continuous integration](https://en.wikipedia.org/wiki/Continuous_integration)
for testing,
so this stage will be automatic. If automatic tests don't pass, I don't look at your change.
You must ensure that everything passes (so called: "build is green") to get
attention.
If you provide the tests for your new code, then it's excellent.
If the original project didn't have any tests, try to improvise, and add
something like `testthis.sh` script to verify the functionality.

Then I'd like to see if any of the previous functionality broke, by simply
running the code. This is the final step.  And just like with the previous
ones: the less work I need to sacrifice for your change and prove that the
code works, the bigger the chances are for getting your code in.

## Documentation

This is pretty essential. I really dislike when I see some
indication of functionality I use, but when I don't know how to invoke it.
Always remember that for one writer there are one hundreds readers of code,
and they will thank you for providing them hints of the functionality. Do
it, and once again -- chances of "Merge" button being pressed grow rapidly.

## Summary

Comments included here will make you a better expert. I believe that
by following these suggestions, your pull requests will be merged faster,
and you'll progress faster in your career too. **Let me know how it goes and
whether you think anything is missing from this list**

**You may also like**

* "[How best companies do continuous integration](http://www.koszek.com/blog/2015/06/29/how-best-companies-do-continuous-integration)"
* "[Optimize for developer's, not machine's time](http://www.koszek.com/blog/2015/07/28/optimize-for-developers-time)"
* "[Don't document. Automate!](http://www.koszek.com/blog/2016/04/11/dont-document-automate)"
* "[How much software engineer should invest in career growth](http://www.koszek.com/blog/2017/02/06/how-much-software-engineer-should-invest-in-career-growth)"


[Code Complete]: http://amzn.to/2kzYGqO
[Clean Code]: http://amzn.to/2lVSSbe
