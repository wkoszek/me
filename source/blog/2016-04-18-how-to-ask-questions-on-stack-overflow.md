---
title:	'How to ask questions on Stack Overflow?'
author: "Wojciech Adam Koszek"
address: "Menlo Park, CA"
tags:	article
read:	2016-04-18
published: true
layout:	layout_book
ads:
- 
spellcheck-allow:
- wc
- txt
---

This year I want to contribute to Stack Overflow. I've been using this
site for years, but have never answered any questions, rated answers or
posted replies. I want to change this.

I went ahead and made myself several tags with topics I'm good at. And
as a break from work, I try to answer questions. There is a lot of good
questions, but most of them are bad. People make it hard to help
themselves. They either give a lot of data, but don't formulate the
problem, or state the problem, but give no information about their
setup, environment and conditions. Stack Overflow is no different than
any other technical forum. Mailing lists and GitHub Issues are another
examples. But you must communicate clearly to really benefit from them.

If you want to communicate effectively on these websites, you must
follow a pattern:

-   What do you want to do?
-   What the problem?

It's as simple as that. But remember that technical problems are rather
complex. Very often the issues arise, since the documentation and
available resources didn't encompass your computer, your environment or
your use case. Additionally: on the other side of the screen the person
reading may interpret the words differently. That's why it's very
essential to follow a guideline while posting an issue description or a
question.

Don't get discouraged. I grew up with the Internet and software people.
My experience is that it'll mostly be fine and you'll get help. However
some people are harsh and you'll have to deal with it. Below is a simple
guideline which may help.

# Guideline for asking questions on Stack Overflow

Each section is a question which you must know an answer to before
posting your problem description. Include this data in your post. I give
sample good answers for clarity.

### What do you want to do?

I want to count lines in a file.

### What's your method?

I'm trying to use wc command, but it's not working.

### How are you using it?

I'm passing some data to it, but it's printing some 3 numbers, not line
count. Example: `wc sample.txt`.

### What's your test data?

I put sample data to a file sample.txt, and it looks like this:

```
line 1
line 2
line 3
```

### What you get?

So when I pass this `sample.txt`, I get:

```
       4 6 22 sample.txt
```

### What do you expect?

I'd expect to get 3.

### What's your computer/operating system?

I use Mac with Yosemite.

### What's your environment?

I use bash.

# Summary

When you have problems stated like the example above, it's much easier
to figure out what the person wants, and she/he gets and how to help
them. Solution would be to pass `-l` as a flag.

![](2016-04-18-how-to-ask-questions-on-stack-overflow/image01.jpg)
