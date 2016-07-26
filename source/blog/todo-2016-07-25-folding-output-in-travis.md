---
title: 'Dealing with long-running jobs on Travis-CI'
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
[through continuous integration](http://www.koszek.com/blog/2016/07/11/what-i-learned-from-connecting-60-projects-to-ci-system/),
so I end up working with [Travis-CI](http://www.travis-ci.org) a lot.
Travis provides a corresponding diagnostic page for each project I have
linked to it from GitHub.
For example one of my GitHub projects [is here](https://github.com/wkoszek/cpu60) and 
its Travis-CI subpage [would be here](https://travis-ci.org/wkoszek/kmnsim).
If you look at the link format, you'll understand what I mean.
In there you can see what the output of your job was.
Most of the jobs are fairly simple and finish within short period of time.
For these jobs debugging the build steps is easy: just look at the console
output and see what's wrong. It's what I do 95% of time. Below I give hints
on how to handle 5% of other cases.

# Bigger projects

While working on [Sensorama for iOS](http://www.sensorama.org) I had
to do something different, since it generates a lot of output from
many tools.
It has many dependencies on [Ruby Gems](https://rubygems.org) and
[CocoaPods](https://cocoapods.org/), which make it long-running as well.
Unless you're careful, you'll make your life and Travis job debugging
harder. For me debugging OSX/iOS projects is especially challenging, since it's a
flow of: bug, commit, verify cycles (for Linux/UNIX projects you can run
Travis-CI environment in a Docker container).

# Travis-CI limits for Open Source projects

Travis-CI is entirely free for Open Source, which I find great.
Even though its run-time limits are pretty generous,  they do exist.

The limits I know about:

* time limit on jobs: which currently is set to 30 minutes.
* 10 minute watchdog: if your job doesn't output anything in this period, it will be killed.
* size of the output files is limited to 4MB. If you run over it, your job will be killed.

How does the issue look like?

Example ([from here](https://travis-ci.org/wkoszek/sensorama-ios/builds/145737758)):

```
+scan --workspace Sensorama.xcworkspace --scheme SensoramaTests
[08:12:08]: xcrun xcodebuild -list -workspace Sensorama.xcworkspace
No output has been received in the last 10m0s, this potentially indicates a
stalled build or something wrong with the build itself.
The build has been terminated
```

Another one ([from here](https://travis-ci.org/wkoszek/sensorama-ios/builds/146298516)):

```
/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator9.3.sdk -fasm-bloc
The log length has exceeded the limit of 4 MB (this usually means that the test suite is raising the same exception over and over).
The job has been terminated
```

How to deal with this stuff?

# Prettifiers

For XCode projects just pipe everything what comes from `xcodebuild` through
`xcpretty`. 
Pretty short section, as I'm sure each case you encounter 

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
