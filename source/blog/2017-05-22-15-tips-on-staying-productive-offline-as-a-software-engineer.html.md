---
title: "15 Tips on Staying Productive Offline as a Software Engineer"
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
image: https://www.koszek.com/img/2017-05-22-15-tips-on-staying-productive-offline-as-a-software-engineer/courtney-recker-190987_10p.jpg
ads:
-
spellcheck-allow:
---

Software engineer offline you can be more productive.
I argue that being offline actually helps a lot, especially with *focus*.
You may in theory waste your time becuase you'll reimplement a function,
or done things suboptimally, but it's not that much of a deal.
Below I tell you how to give it a try, and I walk you through the tools I use.
Why staying offline may help?

![alt_text_0](/img/2017-05-22-15-tips-on-staying-productive-offline-as-a-software-engineer/courtney-recker-190987_10p.jpg "Image_text_0")

## No distractions

When you flip 'Wi-Fi' off, [Hangouts](https://hangouts.google.com/), [Slack](https://slack.com/), [HipChat](https://www.hipchat.com/), e-mail notifications,
push notifications, iMessage and your other enemies stop to work. Do it
regularly and you'll see its benefits.

## Source code

Just fetch Git repositories upfront. You should have a directory on your
Desktop or a home folder, where you fetch everything (I call it '~/r' for
"repositories). The reason for this is that a virtual machine started in "r"
directory will make these repositories show up in the VM's filesystem, so
that you can safely play with source code and various versions of compilers
and interpreters.

Git works great by default, because it was designed for a distributed work.
Subversion and CVS on the other hand aren't. You must have a direct access
to the server to deal with repos. As a remedy--fetch the code, and do:

	svn co https://svn.freebsd.org/base/head
	cd head
	git init
	git add *
	git commit -m "snapshot of the code for reading"

Many projects also have mirrors on GitHub, so check that first if you have
to.

When you're on LTE or a crappy Wifi it's much better to just SSH to your
remote box (you do have a remote box for your own purposes, right?) and just
`git clone` there. After cloning, you can always do:

	rm -rf project/.git && tar cJf project.txz project/

and download `project.txz` for bandwidth saving.

Nice thing about Open Source is that you can figure most of the things out
if you apply yourself. I've got much better at code reading thanks to
offline work, because instead of going to [Stack
Overflow](https://www.stackoverflow.com), I went to the
source code instead.

## Todo Lists

During work on source code, post of the time I'm collecting notes.
Notes and 'to do' items land on my list, which helps me beeing productive.
To do when I work offline has a special task as well: I postpone visiting
the sites which I must visit. I wish [pinboard.in](https://pinboard.in/) worked offline.

Writing to do lists and going through them is explained in Getting Things
Done.

<a href="https://www.amazon.com/Getting-Things-Done-Stress-Free-Productivity/dp/0143126563/ref=as_li_ss_il?ie=UTF8&qid=1495640008&sr=8-1&keywords=getting+things+done&linkCode=li2&tag=wkoszek08-20&linkId=48dbe96f1769e5f30236381f3da83aef" target="_blank"><img border="0" src="//ws-na.amazon-adsystem.com/widgets/q?_encoding=UTF8&ASIN=0143126563&Format=_SL160_&ID=AsinImage&MarketPlace=US&ServiceVersion=20070822&WS=1&tag=wkoszek08-20" ></a><img src="https://ir-na.amazon-adsystem.com/e/ir?t=wkoszek08-20&l=li2&o=1&a=0143126563" width="1" height="1" border="0" alt="" style="border:none !important; margin:0px !important;" />

If you have problems achieving your goals, I highly encourage you to get it.
It helped me a lot. 

Without turning our discussion to "to do list app comparison", I use
[Wunderlist](https://www.wunderlist.com/). You use something similar already, so done change anything here.
Microsoft recently acquired Wunderlist, so picking it up now may not be a
good choice. But it works in a decent way offline, and I've been using it
since 2014, so for now I'm stuck with it.

![alt_text_39](/img/2017-05-22-15-tips-on-staying-productive-offline-as-a-software-engineer/wunderlist_50p.jpg "Image_text_39")

## Development environment

While `apt`, `brew`, `gem` and other distributed software is great, they
suck during offline work. You must arm yourself for offline work, so that
calling `apt` won't be required. I do this with Vagrant. Before trips,
unless I already use a VM for my project, I'll do:

	mkdir offline_project
	cd offline_project
	vagrant up ubuntu/trusty64
	vagrant ssh

and then provision my development environment inside. There's nothing more
frustrating than getting into the train, starting "rails server" and
realizing that some `.deb` packages of some Ruby `gems` aren't installed.

The tools have their quirks, so while `gem` may install a lot of megabytes
of data, the Homebrew takes forever to run due to its default policy to
update on each run (use `env HOMEBREW_NO_AUTO_UPDATE=1 brew ...` instead).
In other words: have your tools ready.

## Reading long articles

Read on Kindle, if you can. Install "Send to Kindle" Chrome extension, and
click it each time you stumble upon a website which is interesting. It'll
get transfered to Kindle, and afterwards it'll be available on it. Kindle is
great because of long battery life, but terrible if the text you want to
read has graphics.

![alt_text_23](/img/2017-05-22-15-tips-on-staying-productive-offline-as-a-software-engineer/kindle_75p.jpg "Image_text_23")

## Distraction free reading: websites and blogs

Nowadays there are few blogs that I really follow, yet if I like the
website's content, I may subscribe to their RSS feed. I use [Vienna
RSS](http://www.vienna-rss.org/):

![alt_text_35](/img/2017-05-22-15-tips-on-staying-productive-offline-as-a-software-engineer/vienna_75p.jpg "Image_text_35")

It works fine offline, so before long trips I'll sync articles to it, and
then I can read them.

There are many more options such as [Reeder](http://reederapp.com/) or [ReadKit](http://readkitapp.com/). They can sync-up with
[Pocket](https://getpocket.com/), [Pinboard.in](https://pinboard.in/) and many other "read later" managers.

## Reading complete collections of articles

There are companies like [CrazyEgg](https://www.crazyegg.com/) or [KISSmetrics](https://www.kissmetrics.com/) whose blogs are full of
valuable content. I'm experimenting with fetching these articles in a form
available to me online. I've made a primitive repository for scripts which
fetch stuff from websites and let me make PDFs for reading:

[https://github.com/wkoszek/stay_offline](https://github.com/wkoszek/stay_offline)

Feel free to contribute your scripts.

In parallel I'm experimenting which
[https://github.com/fivefilters/ftr-site-config](FiveFilters) and
[https://feedhq.org](https://feedhq.org) which convert the websites to RSS
feed with essential content. This should work great for offline reading. I
just haven't tried that yet. If you use them, let me know.

## Reading documentation

Reading documentation is another nut to crack, because this type of content
is very hyperlink-rich. You'll find yourself reading 1/4 of a page of text,
and may need to lookup 3 more pages. Not only that, some documentation
package are big, in hundreds of MBs big. I use
[Dash](https://kapeli.com/dash) for this.

![alt_text_11](/img/2017-05-22-15-tips-on-staying-productive-offline-as-a-software-engineer/dash_75p.jpg "Image_text_11")

It's an OSX
reader for offline documentation packages called 'docsets'. Community
generates 'docsets' for particular technology, and we can read them offline.


Dash is good enough, so I paid $25 for it. If you're offline rarely, it's
free, with the exception that each time you switch a chapter in a docset,
you'll have to wait 10s.

## Writing

Writing offline isn't as much hassle as reading. Not much to cover here. I'm
figuring out my favorite stuff for this. After trying
[Quiver](http://happenapps.com/#quiver) and
[Ulysses](https://ulyssesapp.com), mostly because I'm a fan of 3-pane mode,
as it fits a lot of data on my screen.

I also use [Vim](https://www.vim.org).
I'm writing to you from Vim, in fact. Just an old habit.

## YouTube tutorials / documentaries / fun stuff

Use [youtube-dl](https://ulyssesapp.com).

This is my best tool for productive work, and I often use it
like:

	youtube-dl -a -

(I now paste the links of videos I want, and then press CTRL+d).

## Watching on an iPad

When I travel or go in nowhere land, I bring my iPad Pro. It's as big and as
heavy as my Macbook Air, but also has a battery that can last for a long
time. Watching videos and trainings on it is great. I use [OPlayerHD
Lite](https://itunes.apple.com/us/app/oplayerhd-lite-media-player-video-file-manager/id385896088?mt=8)
for this.

There are reasons why I picked OPlayerHD Lite over other players: after I connect
an iPad to my Mac, it makes the OPlayer's folder visible in iTunes. So you
can drag & drop whole folders to an iPad.

![alt_text_17](/img/2017-05-22-15-tips-on-staying-productive-offline-as-a-software-engineer/ipad_75p.jpg "Image_text_17")

Another reason: you can do it without cables. Either use iTunes sharing
through Wi-Fi, or via OPlayerHD: it has an HTTP server, so you can upload
files directly to it.

## Podcasts

There's not much choice here. You should use iTunes. For sound podcasts,
it's not much of an issues. For videos, just synchronize all
the episodes, and if required, copy them over to your iPad/iPhone. If you
don't like iTunes, watch them in [OPlayerHD
Lite](https://itunes.apple.com/us/app/oplayerhd-lite-media-player-video-file-manager/id385896088?mt=8).

## Dropbox

[Dropbox](https://www.dropbox.com) is really bad for offline work. You must sync every file one by one
to get it downloaded for offline mode. For PDFs it's terrible, since
included PDF reader doesn't do a good job. But in the emergency situation it
should be fine to just see/read stuff. So just remember that "Make available
offline" optino it's there (at least on the iOS)

My belief is that [Google Drive](https://www.google.com/drive/) app is better, but honestly I'd like
something trivial, as: download all the cloud to my phone, and let me use
native apps for accessing content. For example: fetched PDFs I'd like to
read in iBooks.

## If you can't go offline - blocking websites

Use [Stay Focused](https://chrome.google.com/webstore/detail/stayfocusd/laankejkbhbdhmipfmgcngdelahlfoji?hl=en)
- Google Chrome extension which times websites which
you give it. If you give it Facebook, LinkedIn, Twitter and others, it'll
time you and stop you from wasting hours in your social circles.

![alt_text_27](/img/2017-05-22-15-tips-on-staying-productive-offline-as-a-software-engineer/stay_focused_50p.jpg "Image_text_27")

## Blocking unwanted traffic

I need to figure this out. I'm not using anything now, but you and I should.
Especially on LTE, when a random program starts to fetch stuff in the
background.
Blocking all the programs for 40 minutes with the exception of your own browser would be
nice. [LittleSnitch](https://www.obdev.at/products/littlesnitch/index.html)
program should be able to do it. I just haven't tried that yet.

If you're comfortable with `pf`, the OSX comes with a fully-featured BSD
`pf` network filter, and it should all be possible there.

## Summary

Staying offline should help you. Try the programs from above, and if you use
something better, definitely let me know. I'd like to give it a shot.
