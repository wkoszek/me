---
title:	"Why the Go Language Won't Be Successful"
author: "Wojciech Adam Koszek"
abstract: >
  My take on Go usability from the perspective of the 1st time user.
  My most-read article so far.
address: "Menlo Park, CA"
tags:
- "programming"
description: "Things which frustrated me about Go bootstrapping."
read:	2015-07-22
published: true
ads:
- 
spellcheck-allow:
- "untrusted"
- "toolchain"
- "CSH"
- "js"
- "repaste"
- "npm"
- "GOPATH"
---


The other day I stumbled upon a [Google Drive command line client](https://www.google.com/url?q=https%3A%2F%2Fgithub.com%2Fprasmussen%2Fgdrive&sa=D&sntz=1&usg=AFQjCNGAiYDSR3UBgK6bT9wAoUSUPQrd-A). It’s a software project written in the Go language. It lets you access Google Drive from the command line. I felt it was a great project, and I wanted to give it a shot, so I started reading. Unfortunately, the program is distributed in binary form, and given several problems that GitHub has had over the past 2 years or so, I’d rather not run binaries from GitHub on my machine. Makes sense, right?

Open source security paradox: Binary files on [GitHub.com](https://www.google.com/url?q=https%3A%2F%2Fgithub.com%2F&sa=D&sntz=1&usg=AFQjCNHReqsuKT6C86HcgL4TbSevF24rxQ) are no more or less secure than fetching 10–15 different open source libraries, also from GitHub.com, coming from authors whom you’ve never heard about nor whose identities you have had a chance to verify. Then you have to run it in a compiler delivered to you by [Homebrew](http://www.google.com/url?q=http%3A%2F%2Fbrew.sh%2F&sa=D&sntz=1&usg=AFQjCNHrrshO8z0224JXLROZjA2WKmARsg), which you too know little to nothing about. And then somehow, upon using this completely untrusted and unprotected toolchain, you end up feeling a sense of accomplishment about doing something the secure way.

I’m exactly the same. So instead of fetching a file and running it, I cloned the repository:

~~~ terminal
git clone https://github.com/prasmussen/gdrive.git
~~~

and started reading how to build its contents. It all seemed fairly simple:

~~~ terminal
go build drive.go
~~~

This looked amazing. Go is great, I thought. The file drive.go has some links to GitHub.com, which I believed were very neat and close to what one would expect would be a reality for a modern programming language: [integration with services](http://golang.org/doc/code.html) that rule in the source engineering world.

“Fine,” I said, and I decided to give it a shot. I installed Go:

~~~ terminal
$ sudo brew install go
==> Downloading https://homebrew.bintray.com/bottles/go-1.4.2.yosemite.bottle.1.tar.gz
######################################################################## 100.0%
==> Pouring go-1.4.2.yosemite.bottle.1.tar.gz
==> Caveats
As of go 1.2, a valid GOPATH is required to use the `go get` command:

  https://golang.org/doc/code.html#GOPATH

You may wish to add the GOROOT-based install location to your PATH:

  export PATH=$PATH:/usr/local/opt/go/libexec/bin

==> Summary

🍺  /usr/local/Cellar/go/1.4.2: 4566 files, 155M
~~~

“Oops,” I warned myself. Looks like I can’t just use it. I must modify my BASH environment. “But wait, hold on,” I repeated once again. I don’t use BASH. As a FreeBSD person, I got schooled and have written all scripts for my daily environment in CSH, which I use to this day. “But it’s fine,” I thought. “I know how to make it work.”

But oh wait. It’s actually telling me I need to go and read the documentation first, since otherwise, it won’t work. All other technologies, such as Ruby, Python, and Node.js, can be installed and just work, but Go apparently can’t.

So I went and extracted BASH commands from the documentation  and made them work for me:

~~~ terminal
% rm -rf $HOME/go
% mkdir $HOME/go
% setenv GOPATH $HOME/go

% set path=($path $GOPATH/bin)
~~~

and nearly sure it should be enough, I ran the installation command once again:

~~~ terminal
% go build drive.go

drive.go:5:2: cannot find package "github.com/prasmussen/gdrive/cli" in any of:
        /usr/local/Cellar/go/1.4.2/libexec/src/github.com/prasmussen/gdrive/cli (from $GOROOT)
        /Users/wk/go/src/github.com/prasmussen/gdrive/cli (from $GOPATH)

drive.go:6:2: cannot find package "github.com/prasmussen/gdrive/gdrive" in any of:
        /usr/local/Cellar/go/1.4.2/libexec/src/github.com/prasmussen/gdrive/gdrive (from $GOROOT)
        /Users/wk/go/src/github.com/prasmussen/gdrive/gdrive (from $GOPATH)

drive.go:7:2: cannot find package "github.com/prasmussen/gdrive/util" in any of:

        /usr/local/Cellar/go/1.4.2/libexec/src/github.com/prasmussen/gdrive/util (from $GOROOT)
        /Users/wk/go/src/github.com/prasmussen/gdrive/util (from $GOPATH)

drive.go:8:2: cannot find package "github.com/prasmussen/google-api-go-client/googleapi" in any of:

        /usr/local/Cellar/go/1.4.2/libexec/src/github.com/prasmussen/google-api-go-client/googleapi (from $GOROOT)
        /Users/wk/go/src/github.com/prasmussen/google-api-go-client/googleapi (from $GOPATH)

drive.go:9:2: cannot find package "github.com/voxelbrain/goptions" in any of:

        /usr/local/Cellar/go/1.4.2/libexec/src/github.com/voxelbrain/goptions (from $GOROOT)
        /Users/wk/go/src/github.com/voxelbrain/goptions (from $GOPATH)

~~~

“Fiasco once again,” I said. Well, let’s decipher it. It’s telling me that it didn’t find packages but doesn’t really tell me what to do next. It leaves me hopeless and sad and forces me to go and figure out [how to add missing packages](https://www.google.com/url?q=https%3A%2F%2Fcoderwall.com%2Fp%2Farxtja%2Finstall-all-go-project-dependencies-in-one-command&sa=D&sntz=1&usg=AFQjCNEzp09ZaM354aAit0fncD2yzu93Pg) by myself.

So I run:

~~~ terminal
% go get ./...
go install: no install location for directory /Users/wk/tmp/gdrive outside GOPATH
go install: no install location for directory /Users/wk/tmp/gdrive/auth outside GOPATH
go install: no install location for directory /Users/wk/tmp/gdrive/cli outside GOPATH
go install: no install location for directory /Users/wk/tmp/gdrive/config outside GOPATH
go install: no install location for directory /Users/wk/tmp/gdrive/gdrive outside GOPATH
go install: no install location for directory /Users/wk/tmp/gdrive/util outside GOPATH
~~~

Unfortunately, it didn’t work. At this point I lose my feeling of control over Go. I looked at the top of the drive.go file, read some documentation, and decided to patiently repaste these commands:

~~~ terminal
% go get github.com/prasmussen/gdrive/cli
% go get github.com/prasmussen/gdrive/gdrive
% go get github.com/prasmussen/gdrive/util
% go get github.com/prasmussen/google-api-go-client/googleapi
% go get github.com/voxelbrain/goptions
~~~

But it was all too fast, so I didn’t think it helped:

~~~ terminal
% go build drive.go
~~~

But it did!

It worked, but my overall experience with Go so far is that I don’t want to come back. Programs such as pip, Gem, and npm have spoiled me, and I don’t want to go back to the old way of doing things where everything has to be typed into the terminal and later verified.

“It’s not possible!” some may say. But I know that’s not true. Take [Vagrant](https://www.vagrantup.com/) for example. Vagrant is accomplishing something very complex in a way that is really simple for the user. It configures and starts a virtual “computer emulator” and hides all ugly and cumbersome bits and pieces from the user, delivering an amazing user experience. Vagrant can start a virtual computer on my host machine with only 3 commands.

~~~ terminal
vagrant init ubuntu/trusty64
vagrant up
vagrant ssh
~~~

I execute the very same 3 commands each time I need a new separate virtual computer for my dangerous experiments. It took longer the 1st time I tried it, as it was downloading the necessary files, but first: it informed me that it was doing the right thing, and I didn’t really have to care since, while it was mirroring the Internet on my laptop, I was doing other things.

Note: nothing that the Go program asks me to do couldn’t be done by asking me or just assuming safe details. For example, on Go’s first start, I could see:

“This is the first time you’re running Go on this computer. Will use ${HOME}/go for Go packages. Specify the GOPATH if you want to use a different path.”

And most users wouldn’t have to do anything in this case.

To conclude: unless the Go Language moves quickly towards the Gem, npm, or pip model or starts to have a user experience similar to Vagrant’s, I feel like a large number of users might be demotivated by the high entry-level barrier.
