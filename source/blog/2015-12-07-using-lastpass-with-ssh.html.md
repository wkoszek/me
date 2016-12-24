---
title:	'How to store SSH passphrases in LastPass'
author: "Wojciech Adam Koszek"
description: >
  LassPass improved my flow for passwords, and in this article I present how
  to make it work for SSH keys and their passphrases.
address: "Menlo Park, CA"
tags:
- "software engineering"
- "tools"
read:	2015-12-04
published: true
ads:
- 
spellcheck-allow:
- 'LastPass'
- 'decrypt'
- 'decrypting'
- 'filename'
- 'lastpass'
- 'lpass'
- 'myrepos'
- 'subfolder'
---


Passwords are a terrible authentication mechanism. Even though this
mechanism exists in computer systems for years, frankly there aren’t too
many solutions to address the password problem. If you’ve dealt with
more than three different APIs I bet you must have committed
confidential data to GitHub at least once. SSH with its keys isn’t any
better, and is used in more critical places.

Below I attempt to address the SSH passphrase problem. My setup is based
on LastPass. LastPass stores a binary bundle with all your passwords in
the cloud. Bundle is fetched on your machine, and you decrypt it with a
master password. During decrypting phone-based 2-factor authentication
is used for increased security. If your master password is weak, you’re
baked. Upon decryption you have an access to all your passwords,
including SSH passphrases. The script automates the management of
ssh-agent and key adding.

## Quickstart

Visit the:
[https://github.com/wkoszek/lastpass-ssh](https://github.com/wkoszek/lastpass-ssh)

## How to use it?

Before we start, full disclosure: LastPass has had 2
[security](https://blog.lastpass.com/2011/05/lastpass-security-notification.html/)
[incidents](https://blog.lastpass.com/2015/06/lastpass-security-notice.html/)
that I know about, plus [they’ve been
acquired](https://investor.logmeininc.com/about-us/investors/news/press-release-details/2015/LogMeIn-to-Acquire-Password-Management-Leader-LastPass/default.aspx)
recently, so it’s up to you to decide if you’re willing to invest your
time in this solution. I just haven’t found anything better than that.
Reports about how LastPass handled the incidents made me feel they know
what they’re doing. Described in this article is a [open-source command
line client](https://github.com/lastpass/lastpass-cli) which they
published and support.

## How to install?

Install `lastpass-ssh` and `lpass` client:

~~~
sudo brew install lastpass-cli
sudo gem install lastpass-ssh
~~~

## Setup

You make yourself an "SSH" subfolder in the LastPass "Secure Notes" and
add secure notes there. Each note has a name and a passphrase. The name
corresponds to the filename of the SSH key file, and the passphrase is
its key's passphrase.

Example: if you have a key like myrepos in `~/.ssh/`, then the name
of the Secure Note would be `myrepos`.

## How to run

Type:

~~~
lastpass-ssh
~~~

It will poll the "Secure Notes/SSH" folder and for each note of name
"A", it'll try to perform `ssh-add ~/.ssh/A` with an appropriate
passphrase.

You can change the location of keys by passing
`--keys-path=<where-you-have-keys>`. By default all keys are
added. You can change this behavior by passing `--key=KEYNAME` option,
where `KEYNAME` is the name of the key file you want to add.

## Details

Internally the lastpass-ssh script is based on the lpass command line
tool provided by LastPass guy themselves.
