---
title:	'Command Line Interface to GoDaddy.com'
author: "Wojciech Adam Koszek"
_layout: post
description: >
  People complain about GoDaddy, but for me it just works. I miss the
  automation and this is my attempt to address that. You get a
  single-command program to set the records in your domains managed by
  GoDaddy.
address: "Menlo Park, CA"
tags:
- tools
- programming
read:	2015-08-06
published: true
ads:
- 
spellcheck-allow:
- "CNAME"
- "GoDaddy's"
- "GoDaddyCli"
- "LastPass"
- "MX"
- "PyGodaddy"
- "PyPI"
- "TXT"
- "github"
- "godaddycli"
- "learnt"
- "pygodaddy"
- "sensorama"
- "username"
---



For quite some time now I’ve been a user of
[*GoDaddy*](https://www.godaddy.com/). I remember my frustration with
[*the Polish registrar*](https://www.nazwa.pl/) holding some of my
`.pl` domains: their user interface was terrible, since after logging
to your account all you could see was an advertisement:

![](2015-08-03-command-line-interface-to-godaddy/image01.jpg)

The website with an ad always loaded very quickly. Then you had to
switch to “Control Panel”, which was always very slow. I could complain
more about the amount of time I have spent trying to do basic things
there, but I’ll leave it as a topic for [*my usability
website*](http://www.barelyusable.com).

So after this bad experience and domain registration stress, I gave
GoDaddy a try a couple of years ago. Just about everything worked right
away, so I stayed with them. (Lesson learnt: if everything is seamless,
the customer will get locked in). In other words, I never looked around
for anything else. [*Many*](http://pinolio.tumblr.com/)
[*people*](http://karveldigital.com/why-i-dont-use-godaddy-you-shouldnt-either/)
[*complain*](http://karveldigital.com/why-i-dont-use-godaddy-you-shouldnt-either/)
about GoDaddy, but it just works most of the time. One of the things
which I missed is a command line interface of some sort, and while I
liked the great [*“If GoDaddy Had a
CLI”*](http://www.mahdiyusuf.com/post/4394455846/if-go-daddy-had-a-cli),
which I discovered after searching around, I knew that I would not get
there quickly. Fortunately there was
[*PyGodaddy*](https://github.com/observerss/pygodaddy). A couple of
hours spent on this and GoDaddyCli was born:

[*https://github.com/wkoszek/godaddycli*](https://github.com/wkoszek/godaddycli)

It only works with the A records for now, which I must admit is quite
limiting, but something is better than nothing. I’ve pushed the code to
PyPI, so on any decent system you should be able to do:

~~~shell

pip install godaddycli

~~~

and get it to work. Usage is simple:

~~~shell

godaddycli

~~~

When you run it for the first time, it’ll ask you for the password and
the username. These are the same values which you provide in GoDaddy’s
Web interface. You’ll also have a chance to store the password/username
in the `~/.godaddyclirc` file, so that you’re not inconvenienced in
the future. I store it in a clear-text format, which is not very secure,
but I feel that there isn’t a perfect solution. I guess one of the next
articles which I’ll write will be on LastPass CLI usage.

If you’re pedantic in your shell scripts, the default action is the same
as specifying “--list”, so you may pass it for clarity. During listing,
by default, I print every record type of every domain. You can suppress
this behavior by specifying explicit `--domain` and `--recordtype`
switches. For example:

~~~shell

godaddycli --recordtype TXT --domain sensorama.org

~~~

This command will only list TXT records of the domain
[*sensorama.org*](http://sensorama.org). To update a domain, you must
use --update switch:

~~~shell

godaddycli --update test.sensorama.org --value 127.0.0.1

~~~

And to delete:

~~~shell

godaddycli --delete test.sensorama.org

~~~

I believe that I have achieved what I wanted, since I needed this
functionality for testing. A challenge for the reader: work out what
needs to be added to
[*pygodaddy*](https://pypi.python.org/pypi/pygodaddy) (the underlying
library for GoDaddy connectivity) to make it work with the
CNAME/TXT/MX/NS records. With this addition, one could create a single
script to configure things such as [*GitHub
Pages*](https://pages.github.com/) entirely from the command line.
