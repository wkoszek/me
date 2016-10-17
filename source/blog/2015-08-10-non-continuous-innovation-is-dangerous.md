---
title:	'Non-continuous innovation = dangerous or “Amazon Ad Platform Cleanups”'
author: "Wojciech Adam Koszek"
address: "Menlo Park, CA"
description: "My take on making continous and non-continuous innovation."
tags:	article
read:	2015-08-10
published: true
layout:	layout_book
ads:
- 
spellcheck-allow:
- "CMS"
- "adsystem"
- "rcm"
- "config"
- "releng"
- "WTF"
- "Leffler"
- "MeetBSD"
- "WordPress"
---



I received an email from Amazon two months ago, but I didn’t really pay
attention to it,letting it stew in my mailbox for a while, until I
visited the [*reading section of my
website*](http://www.koszek.com/reading/) in the hope of referring to
[*the book I read a while
ago*](http://www.koszek.com/blog/2012/12/07/book-the-old-new-thing/),
and all I saw instead of a nice picture was this:

![](2015-08-10-non-continuous-innovation-is-dangerous/image02.jpg)

The cause is good, but the place is bad. So I went back and I dug up the
email:

> As part of our continuing effort to improve the Associates program’s
> products and services, we are making some changes to our technology
> platform. This platform change will require you to replace some older
> product links, banners, and widgets you currently have hosted on your
> website as they will no longer be supported after July 31, 2015. Text
> links are not impacted by this deprecation.
> 
> Action Required
> We ask that you replace or update the impacted ad units prior to July
> 31, 2015. The links require the following update that can be facilitated
> through your CMS (content management system). You may make these
> replacements at whatever scale you are comfortable with.
>  - Find and replace `ws.amazon.com` with `ws-na.amazon-adsystem.com`
>  - Find and replace `rcm.amazon.com` with `rcm-na.amazon-adsystem.com`
> 
> Keep in mind that starting August 1, 2015, any remaining legacy product
> links (text + image, image-only), banners, and widgets will be served
> with non-clickable public service announcements that will not send
> traffic to Amazon, impacting your referring traffic and potential
> earnings, if not addressed. On September 1, 2015, these legacy ad units
> will no longer render, thereby creating a broken link on your website.

I wrote earlier about how making early decisions in the development of
software will probably come back and bite you later. This is an
inevitable truth, and if you think you won’t be impacted, you’ll be
disappointed.

By no means am I judging Amazon here, although I do question whether
replacing a domain from `rcm.amazon.com` to `rcm-na.amazon.com` is
*really* necessary, but my belief is that we’re probably seeing it in
this case too.

It makes me wonder what people using platforms such as WordPress will
have to do. If one embeds the static links of products in a WordPress
website, will they have to be updated by hand? I’d rather not know. In
the Middleman and Jekyll world, we’re quite fortunate:

~~~terminal
sed -i "" 's/rcm.amazon.com/rcm-na.amazon-adsystem.com/g' *
git commit
(cd ../../ && make p)
~~~

And the issue is fixed:

![](2015-08-10-non-continuous-innovation-is-dangerous/image03.jpg)

This reminds me that one of the worst non-continuous improvements I’ve
made to FreeBSD was my enhancement to the kernel configuration system.
FreeBSD has a config(8) program which runs on a set of configuration
files;this in turn traverses the source tree and constructs appropriate
`Makefiles`. Once compiled and booted, however, it wasn’t possible to
recover the kernel configuration from a running system. To fix that, I
serialized the list of all enabled configuration settings to a file
which in turn had to be compiled into the kernel. This meant changing
the config(1) program and the kernel together, since whatever the
`config(1)` generated, the kernel was required handle. I naively
expected people to use my `config(1)` on new kernel sources. But
people don’t want to recompile their `config(1)`. In fact, I learned
that there were number of people using “config.releng_6”,
“config.releng_7”, “config.releng_8” etc in production, and
recompiling those was a major hassle. And so one of the early bug
reports via IRC in the form of “WTF” was from Sam Leffler during the
MeetBSD conference. Then other reports followed. We fixed the problem
finally, but the lesson has been learned: you need to think twice before
breaking people’s systems while making improvements, since these people
will be upset, and you will need to give them a good reason for your
changes.
