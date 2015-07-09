---
title:	'Fixing Middleman-spellcheck'
auth:	Wojciech Koszek
read:	2015-06-20
tags:	article
layout: layout_book
---

Sometimes when you make a change to the software, it is interesting to
predict how long will such change take. Fixing *Middleman-spellcheck* was
initially only about letting myself to select words which I would consider
correct and do it from within the front-matter of each Middleman's article
files. It ended up taking more than I anticipated, and below is short
description on what went wrong.

[Middleman plugin infrastructure](https://middlemanapp.com/advanced/custom_extensions/) lets
one to run a filter on several stages of the build process, and
Middleman-spellcheck runs at the end, once all files are converted from
".md" to ".html" files.

Unfortunately the moment I run Middleman with *Middleman-spellcheck* enabled I
got many, many valid words recognized as misspelled words.

Problem appears to be reported as
[issue #7](https://github.com/minivan/middleman-spellcheck/issues/7).

>
> I think no easy model exists for fixing the source code of Gems installed
> in a system-wide location.
>

I ended up cloning the repository of the project:

~~~ shell
$ cd /w/repos
$ git clone git@github.com:minivan/middleman-spellcheck.git
~~~

and basically doing:

~~~ csh
$ sudo bash
# cd /Library/Ruby/Gems/2.0.0/gems
# mv middleman-spellcheck-0.7.5 middleman-spellcheck-0.7.5.old
# ln -s /w/repos/middleman-spellcheck middleman-spellcheck-0.7.5
~~~

since I don't know any better way to point `Middleman` to use a different
Gem. Middleman-spell is structured more or less like that:

	[wkoszek-macbook:/w/repos/middleman-spellcheck] wk% tree
	.
	├── Gemfile
	├── LICENSE.txt
	├── README.md
	├── Rakefile
	...
	├── lib
	│   ├── middleman-spellcheck
	│   │   ├── extension.rb
	│   │   ├── spellchecker.rb
	│   │   └── version.rb
	│   ├── middleman-spellcheck.rb
	│   └── middleman_extension.rb
	├── middleman-spellcheck.gemspec
	└── spec
	    └── lib
		└── middleman-spellcheck
		    └── spellcheck_spec.rb

	22 directories, 31 files

`extension.rb` is the Middleman-specific code, while `spellcheck.rb` is
where interaction with Aspell is present.

Here's our wolf:


~~~ruby
  def self.query(text, lang='en')
    result = `echo "#{text}" | #{@@aspell_path} -a -l #{lang}`
    raise 'Aspell command not found' unless result
    new_result = result.split("\n")
    new_result[1..-1] || []
  end
~~~

My first guess is was that `#{text}` has some quotes `"`, but it wasn't it.
The way I try to attack the problem is always with the simplified use case.
The pattern is: find for which input the program is failing and try to
reproduce such failure. In my case I have 145 `.md` files, but managed to find
one which is fairly short.

Here are the errors:

~~~
spellcheck  Running spell checker for /blog/2012/12/15/book-the-22-laws-of-marketing/
    misspell  The word 'nd' is misspelled
    misspell  The word 'entirely' is misspelled
    misspell  The word 'want' is misspelled
    misspell  The word 'think' is misspelled
    misspell  The word 'to' is misspelled
    misspell  The word 'numbers' is misspelled
    misspell  The word 'has' is misspelled
~~~

While `nd` is probably correctly classified as a problem, "want" and "think"
are not. It was time to get more visibility:

~~~ diff
diff --git a/lib/middleman-spellcheck/spellchecker.rb b/lib/middleman-spellcheck/spellchecker.rb
index 05a48d1..b82c33a 100644
--- a/lib/middleman-spellcheck/spellchecker.rb
+++ b/lib/middleman-spellcheck/spellchecker.rb
@@ -23,9 +23,12 @@ class Spellchecker
     if @@aspell_cmdargs != ""
       args = @@aspell_cmdargs
     end
-    result = `echo "#{text}" | #{@@aspell_path} #{@@aspell_cmdargs}`
+    print "ARGS:\n#{args}"
+    print "TEXT:\n#{text}\n"
+    result = `echo "#{text}" | #{@@aspell_path} #{args}`
     raise 'Aspell command not found' unless result
     new_result = result.split("\n")
+    print "RESULT:\n#{new_result}\n"
     new_result[1..-1] || []
   end
~~~

Unfortunately it wasn't enough. The problem with middleman-spellcheck is
that it used no temporary variables for intermediate results. I had to
modify code some more to actually understand what's wrong:

~~~ diff
@@ -40,10 +44,21 @@ class Spellchecker
     # the reported mispelled word is actually a correct word.
     # see: https://github.com/minivan/middleman-spellcheck/issues/7
     words   = text.split(/[^A-Za-z’']+/).join(" ")
-    results = query(words, lang).map do |query_result|
+    results_raw = query(words, lang)
+    results = results_raw.map do |query_result|
       correct?(query_result)
     end

+    ww = words.split(" ")
+    print "Words count: ", ww.length
+
+    for i in 0..35 do
+      word = ww[i]
+      ret = results[i]
+
+      print "Word:\t#{word}\tRet:\t#{ret}\n"
+    end
+
~~~

Note that what I'm doing is essentially a very bad looking hack over the
code, but without it, I simply can't actually see which word caused the
problem to aspell.

I compared the sizes of results[] and words[] and basically saw that there
are more results than words. It means that somewhere within my text is a
data that aspell sees as 2 words.

For the purposes of debugging I also modified the input file, so that it
only had 1 paragraph and was throwing 1 error.

After adding instrumentation, I got this:

	...
	Word:	here	Ret:	true
	Word:	weren’t	Ret:	false
	Word:	entirely	Ret:	true
	Word:	due	Ret:	true
	...

Voila. The apostrophe (Hex 2109) seems guilty. We test by hand:


	wkoszek-macbook:/w/me] wk% aspell -a
	@(#) International Ispell Version 3.1.20 (but really Aspell 0.60.6.1)
	weren’t
	& weren 30 0: Warren, warren, wherein, whereon, Wren, ween, were, wren,
	Wezen, Webern, we're, wearing, weeny, where, Verne, wen, weren't, Green,
	green, preen, wearer, Vern, Ware, ware, warn, wean, when, wire, wore, worn
	*

Here's our problem. Middleman takes care of the Web typography and converts
character ' to character ’ internally. So HTML files, which
middleman-spellcheck sees use the "aspell unfriendly" version. This causes
our problems.

There were several issues with the original code, and I suggested couple
of improvements, so that further debugging efforts were easier. In my fix
the code passes individual words to aspell, so that in case of problems, we
can see what's going on. I added a "debug" keyword, and couple of others.

[My original pull request](https://github.com/minivan/middleman-spellcheck/pull/12)

> **UPDATE 2015-06-21**:
> *Middleman-spellcheck* author merged my pull request, so
> hopefully you shouldn't encounter additional problems.
>

Right now all of my 145 files can be correctly checked with
middleman-spellcheck.
