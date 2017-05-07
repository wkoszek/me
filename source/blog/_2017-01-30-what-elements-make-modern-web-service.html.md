---
title: "What software makes a modern web application"
author: "Wojciech Adam Koszek"
_layout: post
description: >
  I explain what software elements go into a modern web application of
  medium complexity.
address: "Menlo Park, CA"
tags:
- "software engineering"
published: true
image: http://www.koszek.com/img/2017-01-28-why-you-should-start-programming-on-unix/unix_75p.jpg
ads:
-
spellcheck-allow:
---

Modern web applications have two parts: frontend and backend. Frontend is
what runs on your phone or in the browser. Lets not about it for now,
because this article will take too long. I just want you to understand the backend part for now.

Backend is where the
heart of your logic is, and where the database lives. Logic and data is a
simplified model on how it's structured, and these days you're hear people
talk about [Model-View-Controller][] concept. Here I will cover Model and
Controller only, and will show you which software plugs in to make a
backend.

So the browser triggers a request as a part of a user action. Let it be a
tap on a button for example. The server will receive this request and the
HTTP server will be the entity handling it. It's a rare case that only
server would be involved.

So you may guess it's
where the Historically backend
was uniform. For example, you'd have a HTTP server receiving your requests
and serving you data.

It's called a backend because it's something the user doesn't see.
It's simpler than anything else around.

