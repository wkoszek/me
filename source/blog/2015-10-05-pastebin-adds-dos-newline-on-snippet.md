---
title:	'Pastebin adds DOS new-line separators at the end snippets'
tags:	article
read:	2015-10-05
published: true
layout:	layout_book
image: https://www.djerfy.com/wp-content/uploads/2014/12/Pastebin-simple.png
ads:
- 
---

Over the weekend I was finally starting to get my head wrapped around
automated backups on my Synology DS214. This was supposed to be a ten
minute project which of course extended due to some trivial problems
along the way. For example: I needed a Python script for fetching data
from the Internet over HTTPS so I made this for myself:

~~~python
#!/usr/bin/env python
import urllib2, sys
urlstr = sys.argv[1]
fname = urlstr.split('/')[-1]
response = urllib2.urlopen(urlstr)
f = open(fname, "w")
f.write(response.read())
f.close()
print "written " + fname
~~~

And I pasted it to PasteBin:

[http://pastebin.com/ETv4pRjK](http://pastebin.com/ETv4pRjK)

On the Synology I fetched it through a “raw” mode, which presents you
with just clean data from a snippet, with no HTML tags:

~~~shell
wget -O wget2 "http://pastebin.com/raw.php?i=ETv4pRjK"
chmod 755 wget2
~~~

And when I ran it, I got this:

~~~shell
wkoszek_nas> ./wget2
: No such file or directory
~~~

At first I believed that the script’s frontmatter “#!” was wrong, but
even after spending some time on it I still hadn’t figured out what was
going on; then I saw this:

~~~shell
wk:~> ls -la wget wget2
-rw-r--r-- 1 wk staff 209 4 paź 01:48 wget
-rw-r--r-- 1 wk staff 216 4 paź 01:48 wget2
~~~

Pastebin is adding DOS new-line separators at the end of each line. I
suspect that such behavior may make sense for Windows users, but for
MacOSX/UNIX users it introduces problems. I wish there was a way to turn
it of...

Until such time as I can find a way, weneed to stick to this:

~~~
wget -O - 'http://pastebin.com/raw.php?i=PcbNtyh9' | tr 'r' ' ' > wget2
~~~

On Linux/MacOSX, the `cat` has a `-v` flag, which is also very
helpful:

~~~shell
wk:~> cat -v wget2
#!/usr/bin/env python^M
import urllib2, sys^M
~~~

To prevent myself from running into similar trouble, I added this line
to my `~/.vimrc`:

~~~vimrc
set fileformats=unix
~~~
