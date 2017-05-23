---
title: "Software Engineer Offline"
author: "Wojciech Adam Koszek"
klayout: post
description: >
  You can stay offline and be productive. In fact, most of the world's
  inventions were done offline, you know it? I want you through my setup
  for offline work on software.
maillist: >
  In which I explained which tools to use for productive software work offline. This
  should be especially useful to you if you find yourself often doing ...
  other things.
address: "Menlo Park, CA"
tags:
- "software engineering"
published: true
image: 
ads:
-
spellcheck-allow:
---

Software engineers are hooked up to the Internet 24/7.
Many say it's required to be online to stay productive.
I argue that being offline actually helps a lot.
For me, my full focus and "being in the zone" I achieve mostly
offline. You're the same, but you don't know it yet.
Below I tell you how to give it a try, and I walk you through the tools I
use.
Why staying offline may help?

## Focus and clear mind

Staying online constantly is inproductive in my opinion for one particular
reason: **focus**. When you care about your project, you often just need
enough hours of silence to get it done. Online world doesn't care about
focus. With Hangouts, Slack, HipChat, e-mail notifications, push
notifications, iMessage and others, staying focused is hard. Add on top of
that the temptations of the modern web which the primitive brain of the
mamal loves, and you're wasting time as if there was no tomorrow.
Let's attack this first.

You should look at Getting Things Done if you have problems achieving your
goals. It helped me a lot. After I started using to-do lists, my life
became significantly better, and I have much more control over incoming
issues and tasks.

I use Wunderlist for this. It works OK offline. Not perfect, but fine. Good
enough to make complainin counterproductive. Wunderlist is unfortunately
going to get sunset after Microsoft acquired it, so if you're reading it now
and you're not using any to-do list manager, maybe pick something else.

## Development environment

While `apt`, `brew`, `gem` and other distributed software is great, they
suck during offline work. You must arm yourself for offline work, so that
calling `apt` won't be required. I do this with Vagrant. For the development
you want to do you need a VM with all tools installed.

## Reading text / articles

Read on Kindle, if you can. Install "Send to Kindle" Chrome extension, and
click it each time you stumble upon a website which is interesting. It'll
get transfered to Kindle, and afterwards it'll be available on it.

No ads, no temptation to open websites, since browsing web on Kindle sucks.
But you'll be able to read without interruptions.

## Reading blogs

Nowadays there are few blogs that I really follow, yet if I like the
website's content, I may subscribe to their RSS feed. I use this client:

http://www.vienna-rss.org

It works fine offline, so before long trips I'll sync articles to it, and
then I can read them.

## Reading documentation

Reading documentation is another nut to crack, because this type of content
is very hyperlink-rich. You'll find yourself reading 1/4 of a page of text,
and may need to lookup 3 more pages. Not only that, some documentation
package are big, in hundreds of MBs big. I use Dash for this. It's an OSX
reader for offline documentation packages called 'docsets'. Community
generates 'docsets' for particular technology, and we can read them offline.

Dash is good enough, so I paid $25 for it. If you're offline rarely, it's
free, with the exception that each time you switch a chapter in a docset,
you'll have to wait 10s.

## Writing

Writing offline isn't as much hassle as reading. Not much to cover here. I'm
figuring out my favorite stuff for this. After trying Quiver and Ulysses, I
haven't yet found anything really nice. I'm stuck to Vim now. I'm writing
this article for you in Vim, in fact. Just an old habit.

## YouTube tutorials / documentaries / fun stuff

Use youtube-dl. This is my best tool for productive work, and I often use it
like:

	youtube-dl -a -

(I now paste the links of videos I want, and then press CTRL+d).

## Watching on an iPad

When I travel or go in nowhere land, I bring my iPad Pro. It's as big and as
heavy as my Macbook Air, but also has a battery that can last for a long
time. Watching videos and trainings on it is great. I use OPlayer for this.

There are reasons why I picked OPlayer over other players: after I connect
an iPad to my Mac, it makes the OPlayer's folder visible in iTunes. So you
can drag & drop whole folders to an iPad.

Another reason: you can do it without cables. OPlayer has an HTTP server, so
you can upload files directly to it.

## Podcasts

There's not much choice here. You should use iTunes. For sound podcasts,
it's not much of an issues. For videos, just synchronize all
the episodes, and if required, copy them over to your iPad/iPhone. If you
don't like iTunes, watch them in OPlayer.

## Dropbox

Dropbox is really bad for offline work. You must sync every file one by one
to get it downloaded for offline mode. For PDFs it's terrible, since
included PDF reader doesn't do a good job. But in the emergency situation it
should be fine to just see/read stuff. So just remember that "Make available
offline" optino it's there (at least on the iOS)

## Source code

Not much innovative stuff here. Just fetch Git repositories upfront. If
you're on LTE/crappy Wifi remember it's much better to just SSH to your
remote box (you do have a remote box for playing, right?) and just Git clone
there. After cloning, you can always do: `rm -rf project/.git && tar cJf
project.txz project/` and download project.txz for bandwidth saving.


## Blocking websites (if you have to be online)

Use "Stay Focused" - Google Chrome extension which times websites which
you give it. If you give it Facebook, LinkedIn, Twitter and others, it'll
time you and stop you from wasting hours in your social circles.

https://chrome.google.com/webstore/detail/stayfocusd/laankejkbhbdhmipfmgcngdelahlfoji?hl=en


## Blocking unwanted traffic

I need to figure this out. I'm not using anything now, but you and I should.
Blocking all the programs for 40 minutes with the exception of your own browser would be
nice. This program should be able to do it:

https://www.obdev.at/products/littlesnitch/index.html

But I haven't tried. If you're comfortable with `pf`, the OSX comes with a
fully-featured BSD `pf` network filter, and it should all be possible there.
