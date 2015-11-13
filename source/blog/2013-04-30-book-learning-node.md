---
title:	"Learning Node"
auth:	Shelley Powers
read:	2013-05-01
tags:	books
layout: layout_book
ads:
- <iframe src="http://rcm-na.amazon-adsystem.com/e/cm?lt1=_blank&bc1=FFFFFF&IS2=1&npa=1&bg1=FFFFFF&fc1=000000&lc1=FF0000&t=wojcadamkoszh-20&o=1&p=8&l=as4&m=amazon&f=ifr&ref=ss_til&asins=1449323073" style="width:120px;height:240px;" scrolling="no" marginwidth="0" marginheight="0" frameborder="0"></iframe>
spellcheck-allow:
- "NOPs"
- "MOV"
- "Crockford's"
- "JSLint"
- "js"
---
*Be warned -- this is boring and technical thing*

In between my Silicon Valley/business/MBA studies, which finally started to
make me pretty tired, I decided to revert back to something people consider
neat and hot and technically sexy. Something that can expand your skill-set
to something better than "mere mortal".

Javascript is something I explored multiple times. Typically considered a
technology for the weak NOPs and "MOV r0,r0,r0"-kind of people, I felt it's
perfect for me.  Javascript had lots of things which kept me mentally
stimulated.  I think most of the interest towards to Javascript was caused
by Douglas Crockford's publication, especially:

[JavaScript: The World's Most Misunderstood Programming Language](http://javascript.crockford.com/javascript.html)


He also did JSLint:

[JSLint: The JavaScript Code Quality Tool](http://www.jslint.com)

Which is a neat software. Anyway:

Javascript, I believed, really sucks and looses belonged appraisal since I'm
confident nearly all Javascript environment suck as hell and people do
nothing about it. If you expect me to debug my script in a browser in a
windows which consumes 1/3 of height of my screen you're just ridiculous.
Yes, even you, my dear Opera developers (Opera is the most amazing browser
out there, if you haven't noticed yet).

So I was really looking for was a thing where my functions and other "stuff"
could get created, and where I could make sure things work, and then move it
to the browser. Basically: I was not looking for something with explicit
non-blocking memory support.

First about Node I learned from the Node.js author about non-blocking I/O
based on callbacks.

Couple of years ago I was a structured programming retard. Basically I would
take random Java code form Beans which a friend of mine wrote and I'd
criticize him using anonymous functions everywhere. How bad I was. But it
was when I had too much time and less understanding of programming and the
whole functional concept. In other words, it was before meeting a good
friend of mine, Charles. And before I read the LISP book.

So..

I really like the idea of anonymous functions now--they make your code more
compact. Basically things look more condensed and consistent. And there's
something I started to appreciate only after I started working for The Man,
where the "senior senior" contractor explained me pros and cons and his view
on a need of scanning multiple files just to find simple stuff, if #define
values.

Stuff like Javascript notation can be used for lots of things when I think
about it, but I bet it would actually be pretty good for real-time systems.
Most real time systems are all about the loop in which stuff gets executed.
In a loop you typically have a giant state machine, where you try to
dispatch events based on the state.

Javascript would give you the whole painful loop part for free.

Non-blocking I/O makes hard things easy and simple things hard. When you
want to execute sequential block in a asynchronous block, stuff needs to be
wrapped around function/data hierarchy, so that it fits the non-blocking
model.

Some portions of examples are surprisingly simple and surprisingly "new" in
a way makes me thing "why hasn't this been done before". Example:

	require('colors');
	console.log("string".green);

When I think about it, it really doesn't have to get anything better.

From the deployment perspective my understanding is that you basically have
to hack around a lot to make it work, and probably even more to make it
perform well, since stuff looks like something pretty primitive. It's a pity
Node.js doesn't code with a solution letting me to run it continually, just
like Apache. Basically I want a solution which will hide from me the fact
that I need an external program to restart Node.js in case things go WRONG.
It might be the same as it is now (using external "monitor" program to see
if Node is alive), but I don't want to be aware of it.

Unfortunately Node.js doesn't really help with whole WWW page thingy--it's
still is some random code mixed with random HTML tags.

The whole book was just fine, however little or nearly no space (based on
ratios of content) is spent on deeply explaining Node.js nature.
