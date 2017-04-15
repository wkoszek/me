---
title: "How to use Let's Encrypt"
author: "Wojciech Adam Koszek"
description: >
  What is LetsEncrypt? How to use it? How many domains you can LetsEncrypt
  support? How to renew the generated SSL certificate?
maillist: >
  where I explained shortly what is LetsEncrypt and how to use it. I've used
  `dehydrated` (once known as `letsencrypt.sh`), very convenient
  script-client for LetsEncrypt
address: "Menlo Park, CA"
tags:
- "tools"
- "devops"
published: true
image: https://letsencrypt.org/images/le-logo-twitter.png
ads:
-
spellcheck-allow:
-
---

Certificates are an underlying element of the SSL technology. They are an ID of the
Internet, and because of it, people can understand who they connect to.
They provide you encryption in the Internet, as all popular protocols,
because those can be tunneled in the SSL stream.

LetsEncrypt is project and an organization behind free SSL certificates.
It's a baby of Electronic Frontier Foundation and Mozilla Foundation.
Its goal is popularizing encryption and safe exchange of information.
Before you'd have to pay to get this electronic ID--SSL certificate. With LetsEncrypt
it's free.

Here you learn how LetsEncrypt works, how to generate a secure SSL
certificate and how to renew and maintain it.

## How it works

Assume you're John Smith and you want to get a certificate for "domain.com",
install it on your server, and have your website users see "green lock" next
to the address bar.

Normally there are adhoc ways to prove you own "domain.com". If you got
"domain.com" from GoDaddy, it means you have an account there, maybe account
manager called you over the phone etc. In general, they know you own a
domain, so they can also sell you an SSL certificate stating: "Yes, GoDaddy
confirms user John Smith owns domain.com - we verified it".

LetsEncrypt crafted a special protocol called ACME. If you've ever
configured Google Analytics, Mailchimp, custom Medium domain, SPF of DKIM
you might be familiar with how it work:

You must modify something on your side: be it a website or a domain name in
a way that the remote agent (bot) can understand. It might be a request such
as: "Hello domain.com owner; add "iownit.txt" in your website files and put
'allright' there" or "Add iownit.domain.com subdomain and point it to
123.123.123.123". ACME is the same: it's a protocol for doing these secret
exchanges for you.

To benefit from LetsEncrypt, you must have a ACME client.

# 

LetsEncrypt 

letsencrypt how to renew certificate
lets encrypt how to use
how to renew
how often to renew
how it works
how many domains
how to install
