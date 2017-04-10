---
title: "SSH VPN on OSX with SSHuttle in 3 minutes"
author: "Wojciech Adam Koszek"
description: >
  How to setup a temporary VPN from my OSX to my server.
maillist: >
  where I explained one of the really nice SSH VPN tools which I've
  found during my weekend debugging session
address: "Menlo Park, CA"
tags:
- "tools"
- "devops"
published: true
image: https://www.koszek.com/img/2017-03-31-how-software-engineer-should-invest-in-career-growth/oscar-nilsson-1860_25p.jpg
ads:
-
spellcheck-allow:
-
---

You will learn how to setup SSH VPN with [sshuttle](https://github.com/apenwarr/sshuttle) **quickly** here, on the OSX.
SSH VPN people say is "poor man's" [VPN](https://en.wikipedia.org/wiki/Virtual_private_network), but I like it. If you have the SSH
keys installed on the server, there's no need for any other configuration.
No certificates, no drama.

This article is written for you and myself, so that I don't forget how to
use this flow.

You should use the VPN when you access critical resources over untrusted
network. VPN also helps you when the software which you use doesn't support
encryption. Yes, software like this exists, and I learned about it last
week, when I wanted to make myself a flow for making VMs on XenServer box I
share with a friend of mine. XenServer exposes its API via HTTP, which is a
little surprising.. Anyway.

## Quickstart

Install SSHuttle with [Homebrew](https://brew.sh/):

```
brew install sshuttle
```

For some reason the `pip` version, which SSHuttle advertises on its website
didn't work for me.

Run it like this:

```
sshuttle -r user@server
```

Upon the successful connection you should see:

## How to validate VPN connectivity?

Go to any "what's my IP" service (or type "what's my IP" in Google).
It should be your server's IP.

```
$ curl -s -o - https://jsonip.com | jq "."
{
  "ip": "88.129.122.7",
  "about": "/about",
  "Pro!": "http://getjsonip.com"
}
```

## How it works

The SSHuttle doesn't really explain how it works. So I've dug into it. On
OSX it uses a `pf` filter in a way where all your traffic from the network
you specify in the command line is being channeled through SSH's port to the
remote machine.
