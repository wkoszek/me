---
title:	"Unfriendly IT, or how to get Perforce diffs e-mailed to you"
author: "Wojciech Adam Koszek"
klayout: post
description: >
  I show a simple hack for getting Perforce changes e-mailed to you.
address: "East Palo Alto, CA"
tags:
- "software engineering"
- "tools"
auth:	Wojciech Koszek
ads:
- <iframe src="http://rcm-na.amazon-adsystem.com/e/cm?lt1=_blank&bc1=FFFFFF&IS2=1&npa=1&bg1=FFFFFF&fc1=000000&lc1=FF0000&t=wkoszek-20&o=1&p=8&l=as4&m=amazon&f=ifr&ref=ss_til&asins=0596101856" style="width:120px;height:240px;" scrolling="no" marginwidth="0" marginheight="0" frameborder="0"></iframe>
spellcheck-allow:
- "Cron"
- "CRON"
---

Work for a big corporation can be very challenging sometimes. This touches me
especially when I have to request something, and IT department doesn't
agree for providing me this functionality. Sometimes things are very simple,
sometimes are more complex.

In this particular case, I tried to provide myself a way to review Perforce
commits other person working with me was doing. Solution, which we all know to
be pretty darn good, is to have `diffs` e-mailed to you, just like we do on:

[FreeBSD mailing lists](http://lists.freebsd.org)

But, as you already know, getting this functionality isn't always that easy
if you have The Big Brother. Most often than not, I end up crafting myself
yet-another-tiny-script, that helps me a lot.

Here it is:

	#!/bin/sh
	# vim: set tw=1000:

	#
	# You must do p4 changes > ~/.p4_diff/prev before starting
	# to use this script.
	#

	p4=/home/wojciec/bin/p4

	dir=/home/wojciec/.p4_diff/

	mkdir -p $dir

	curr=$dir/curr
	prev=$dir/prev

	$p4 changes > $curr

	diff $prev $curr 2>&1 > /dev/null
	if [ $? -eq 0 ]; then
		# no new commits.
		echo "P4DIFF: no commits";
		exit 0;
	fi

	#Fool-proof stuff
	DIFF_NUM=`diff -u $prev $curr | wc -l | cut -d " " -f 1`
	if [ $DIFF_NUM -gt 25 ]; then
		echo "P4DIFF: something is wrong with metadata: > 25 commits in 5 mins?";
		exit;
	fi

	diff -u $prev $curr | grep '^+C' | while read DIFF_LINE; do
		CHANGE_NUM=`echo $DIFF_LINE | cut -d " " -f 2`
		SUBJECT="P4DIFF `echo $DIFF_LINE | sed 's/^+//' | cut -d " " -f 2,6-`"

		echo "DIFF_LINE      : $DIFF_LINE"
		echo "SUBJECT:       : $SUBJECT";
		echo "CHANGE_NUM     : $CHANGE_NUM";

		$p4 describe -du $CHANGE_NUM | mail -s "$SUBJECT" wojciec
	done
	cp $curr $prev

I purposefully didn't fix it, so that you understand what you're doing
(hint: read the comment). Cron job with this script will produce some junk
on the output and will get e-mailed to you. I prefer that  -- I have a
e-mail filter dumping these e-mails to a separate e-mail folders under CRON/
directory, so that I can inspect things going wrong.

PS: This post doesn't solve "How to keep your Perforce session opened", but
    I'm not brave enough to show it to you, so this is that part you have to
    figure out by yourself.

Script turned out to be pretty useful. I can see from Perforce what sort of
problems hardware group is solving!

