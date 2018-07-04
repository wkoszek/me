---
title: "Solution to an ugly cookie law"
author: "Wojciech Adam Koszek"
klayout: post
description: >
  Proposed solution to a European Union law which made all websites look ugly
maillist: >
  in which I shared my idea on how instead of rushing it, EU could solve the problem of web cookies and tracking
address: "Menlo Park, CA"
tags:
- "software engineering"
published: true
image: 
ads:
- 
- 
spellcheck-allow:
---

European Union has a law that addressed privacy issues of the Internet
users.
The law regulates a technology called
[HTTP Cookies](https://en.wikipedia.org/wiki/HTTP_cookie), which is a clunky but
necessary way of storing state on user's computer.
There's quite a bit of a background in here, and I don't want to diverge
the discussion to technical topics too much.
To make it short: license plate on your car can be used for both identifying
you in front of the protected gate, making sure your car is operational and
registered.
Each time you come back to the gate, and either a camera or a security guest
sees your license plate, you're permitted to go in.
But it can also be used to follow you on a highway and learn where
you live. HTTP cookie is that same for the Internet.

Casper clarified my understanding of the "Cookie Law":

<blockquote class="twitter-tweet" data-conversation="none" data-lang="en"><p lang="en" dir="ltr">The “cookie law” is not about the cookies as technology, but about tracking people for “non-functional” purposes. So login and preferences is fine. Ads tracking not.</p>&mdash; Casper Bakker (@casperbakker) <a href="https://twitter.com/casperbakker/status/1014391738239258626?ref_src=twsrc%5Etfw">July 4, 2018</a></blockquote> <script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>

There are also fear that this law is a little difficult to understand:

<blockquote class="twitter-tweet" data-lang="en"><p lang="en" dir="ltr">I do not say it is a great law or even effective. Only try to get this perception out that the EU is stupid because it is blocking cookies as a technology. That is not what the law is about.</p>&mdash; Casper Bakker (@casperbakker) <a href="https://twitter.com/casperbakker/status/1014434624494325760?ref_src=twsrc%5Etfw">July 4, 2018</a></blockquote> <script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>

The reason is that the entry barrier to making websites has dropped.
It's something people learn in school or from a popular press and books.
Publishing such websites should be possible immediately, and  without
studying European politics.

My take is that the law was rushed, and made without consulting people who
could advise European commission on something that would solve problem in
a right way.

As a result, we end up with websites which work like this:

- Open website
- Website looks beautiful.
- There's an really ugly pop-up window which consumes 30% of the screen, and
  it states:

Many websites just have "Allow" button, as they don't imagine not tracking you.
Let's take Wall Street Journal for instance:

> 
> We use cookies for analytics, advertising and to improve our sire. You
> agree to our use of cooking by closing this message box or contiuing to
> use our site. To find out more, including how to change your settings, see
> our Cookie Policy
>

It is hard to opt-out here, isn't it?

## User point of view

Sad truth about modern Internet: the user has a decision to make:

- be tracked and visit the website
- leave the website

If you follow through all the steps with a set of dialog boxes, you will end
up tracked anyway. What it boils down to isn't very hard to spot:
companies want to charge for
their content online, but have not yet found an effective way to do so.
It's because users are accustomed to free content, and they can't grasp the
idea of paying for reading.

And one needs to communicate to user: this content is paid and if you don't
pay, you can't watch. It's sad for most users, I'm sure.

## Continuous improvement in technology

Technology is a hard thing to change.
Once deployed software lives in users computers and phones for a long time.
But there are examples of companies which brought very complex pieces of
technology in a seamless way.
By seamless I mean: user wasn't aware that the technology switch had
happened, yet they immediately started to rip off benefits from an
improvement.

Notable examples are Google. Google Chrome browser is a battlefield for
testing new web protocols like [QUIC](https://www.chromium.org/quic).

Similar was Apple with an enforcement of encryption with
[Apple Transport Security](https://forums.developer.apple.com/thread/6767)
. Apple announced it during
their WWDC conference that their software will start pushing developers
towards encrypted word.
Not forcibly at first: one would get a warning while accessing unencrypted
resources.
But after enough time has passed, and developers woke up, caught up with the
change and push required updates to the field, the switch was flipped.
If you want to build an insecure iOS application right now, you have to
explicitly tag it so, and let the operating system know which websites
you're going to access in plain text.

Cookie law could be done the same way. Yes, it's harder, but given the
dramatic impact on how all "Cookie warnings" made on the web, it should be
a logical next step.

## Cookie Law, implemented better

European Union has a way to put pressure on certain Internet bodies which
can make Web changes be designed in a hollistic way.
One of the bodies that addresses the problems of technology used in the web
is W3C.
They design technology standards which companies like Google, Apple,
Microsoft and Mozilla could implement in their browsers.

Example of the standard could be: "W3C Cookie Privacy Standard".

In this standard websites would have to publish an abstract on how they use
cookies.
It's not very hard.
In the worst case machine readable file 'cookies.json' could be present in the top-most
directory with the website.
Upon fetching and reading it, the browser would get a hint on what each HTTP cookie does.
Or maybe each HTTP cookie name should indicate what it is: `cookie_auth_`
and `cookie_session_` would be the required ones, and `cookie_aux_` would
be the "other" ones.

User would select their privacy model once.
This choice would happen on a browser level.
In that sense, it'd be similar to the "green lock" which you get in the
address bar upon visit to the encrypted website.

Try it by yourself: [Bank of America](https://www.bankofamerica.com).
You see a green lock next to the URL?

There could be an indicator of the privacy level there too.
Upon the selection, users would either access the website without any more
questions asked each time, or get a popup that a given website doesn't meet
their level of privacy.
Similar dialog you see if you enter websites that appear suspicious or those
which have broken encryption settings.

## Summary

I talked about [bringing continuous changes into existing products before](https://www.koszek.com/blog/2015/08/10/non-continuous-innovation-is-dangerous/)
in a limited scope, but this is far more reaching than that.
I'm a little disappointed that a hard work of web designers around the world
has been distroyed by adding ugly dialogs everywhere.

I know that the law was required, and I believe it's a law backed by a good
principle.
The solution was rushed and done without investigating
how things could be implemented with the collaboration of Web browser
makers.
There are only four of those, that amount to 99% of the Internet.
Having their experience and the EU principle would lead to something better
to what we have now.
