---
title: 'How to enable output folding on Travis'
tags: article
read: 2016-07-25
published: true
layout: layout_book
image: 
ads:
-
spellcheck-allow:
---

I'm releasing [all my projects](https://github.com/wkoszek/)
[though continuous integration](http://www.koszek.com/blog/2016/07/11/what-i-learned-from-connecting-60-projects-to-ci-system/),
so I end up working with [Travis-Ci](http://www.travis-ci.org) a lot.
Most of the jobs are fairly simple and finish within short period of time.
[Sensorama for iOS](http://www.sensorama.org) is different. 
It has many dependencies on [Ruby Gems]() and [CocoaPods](), which make it long-running job.
Unless you're careful, you'll make your life and Travis job debugging
harder.
In the article I show you how I deal with it.

# Limits

Travis Ci has pretty generous limits. It's entirely free for Open Source,
which I find great.
They also have a limit of output which can be presented in the outline
preview.
[IMAGE]
go over 4MB output file limit on Travis pretty

Most of the time I run into some problems with how my job has performed.
Example:

```
+scan --workspace Sensorama.xcworkspace --scheme SensoramaTests
[08:12:08]: xcrun xcodebuild -list -workspace Sensorama.xcworkspace
No output has been received in the last 10m0s, this potentially indicates a
stalled build or something wrong with the build itself.
The build has been terminated
```

# Dealing with a lot out output

4MB is a lot of text, I'd typically say. However it's not true when you use
something like Cocoapods. When I run `pod update`, it can get very chatty. 
Same for `gem cleanup` and `gem update`. The peak comes with `xcodebuild`
which starts to print every single thing it does, including compiler
invocations with all sorts of internal flags in every single line.

# Output folding

And then you [run into issues
with testing](LDO) then the output seems to grow, especially if you don't
pipe your output to `xcpretty`. In this article I 



