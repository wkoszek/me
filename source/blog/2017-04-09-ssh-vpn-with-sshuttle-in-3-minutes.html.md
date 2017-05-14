---
title: "SSH VPN on OSX with SSHuttle in 3 minutes"
author: "Wojciech Adam Koszek"
klayout: post
description: >
  How to setup a temporary SSH VPN from OSX to any server.
maillist: >
  where I explained one of the really nice SSH VPN tools which I've
  found during my weekend debugging session
address: "Menlo Park, CA"
tags:
- "tools"
- "devops"
published: true
image: https://www.koszek.com/img/2017-04-09-ssh-vpn-with-sshuttle-in-3-minutes/rishabh-varshney-138805_5p.jpg
ads:
-
spellcheck-allow:
-
---

You will learn how to setup SSH VPN with
[sshuttle](https://github.com/apenwarr/sshuttle) **quickly** here.
SSH VPN people say is "poor man's" [VPN](https://en.wikipedia.org/wiki/Virtual_private_network), but I view it
as a great tool, since you can't always spin OpenVPN easily. If you have the SSH
keys installed on the server, there's no need for any other configuration.
No certificates, no drama. I'm using OSX for the purposes of this article.

![alt_text_4](/img/2017-04-09-ssh-vpn-with-sshuttle-in-3-minutes/rishabh-varshney-138805_5p.jpg "Image_text_4")
<br>
<small><small><small>
*(Photo by [Rishabh Varshney](https://unsplash.com/@rishabh) via [Unsplash](https://www.unsplash.com))*
</small></small></small>


SSHuttle helped me tunnel over SSH the traffic to a XenServer instance which
I share with a friend of mine. For some reason, Open Source parts of the 
Xen(Server) ecosystem don't concentrate on encryption. I tried fog and
added the SSL encryption there,
[https://github.com/fog/fog-xenserver/pull/68](https://github.com/fog/fog-xenserver/pull/68)
and [Vagrant XenServer](https://github.com/jonludlam/vagrant-xenserver) seems to support SSL, but when I tried packer, once
again, it didn't seem to have SSL support. So I gave up on patching it, and
just used VPN.

## Quick start

Install SSHuttle with [Homebrew](https://brew.sh/):

~~~shell
brew install sshuttle
~~~

For some reason the `pip` version, which SSHuttle advertises on its website
didn't work for me.

Run it like this:

~~~shell
sshuttle -r user@server 0/0
[local sudo] Password:
~~~

You're asked for the local `sudo` password since `pf` also known as "Packet
Filter" is a privileged thing: only root can modify it.

Upon the successful connection you should see:

~~~shell
client: Connected.
~~~

## How to validate VPN connectivity?

Go to any "what's my IP" service (or type "what's my IP" in Google).
It should be your server's IP.

~~~shell
$ curl -s -o - https://jsonip.com | jq "."
{
  "ip": "88.129.122.7",
  "about": "/about",
  "Pro!": "http://getjsonip.com"
}
~~~

## How it works

The SSHuttle doesn't really explain how it works. So I've dug into it. On
OSX it uses a `pf` filter in a way where all your traffic from the network
you specify in the command line is being channeled through SSH's port to the
remote machine.

## Summary

Let me know if it helped you, and maybe which VPN service/solution you use
right now.
