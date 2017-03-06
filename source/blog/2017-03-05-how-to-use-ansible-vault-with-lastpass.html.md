---
title: "How to use Ansible Vault with LastPass"
author: "Wojciech Adam Koszek"
description: >
  I give you the tool which will help you keep your Ansible Vault passwords
  in LastPass. I show how to use it as well.
address: "Menlo Park, CA"
tags:
- "software engineering"
- "security"
published: true
image: https://www.koszek.com/img/2017-03-05-how-to-use-ansible-vault-with-lastpass/james-sutton-187816_10p.jpg
ads:
-
spellcheck-allow:
-
---

There are several competitors for password managers.
I use [LastPass][], because it has an Open Source [command line client][].
This is an officially supported tool, maintained by the LastPass itself.
I haven't audited the code; I have just looked at several `.c` files, and
it seamed decent. Code has been around since 2014, so in the last three
years I suspect both good and bad guys had a chance to find issues.

[Ansible Vault][] is a [Ansible][] solution for managing secrets.  Principle
is similar to LastPass: you have a blob file protected by a master password.
When you deploy code to the server, this blob is unencrypted and passwords
are put in the right place of your choice. So for example `database.php` may
have a database password placeholder, and Ansible will put a password there,
but just during deployment. The code in Git won't have this password in
plain-text. People use Vault because "blob file" can be checked-in to the
Git repository.  It's secure as long as your master password is very strong.

Here I will show you how to keep this Ansible Vault password strong by using
LastPass, its command-line client, and the [lastpass-ansible][] tool which I
wrote.
At the end, your flow will enable you
to login to LastPass from the command line. You'll do it just once, during
your work session.
Then, you'll be able to keep using Ansible Vault with your passwords
automatically channeled from LastPass.

This is a sister-tool to [lastpass-ssh][] which does the same thing for SSH
key passphrases.

![alt_text_0](/img/2017-03-05-how-to-use-ansible-vault-with-lastpass/james-sutton-187816_10p.jpg "Image_text_0")
<br>
<small><small><small>
*(Photo by [James Sutton](https://unsplash.com/@jamessutton_photography) via [Unsplash](https://www.unsplash.com))*
</small></small></small>

## How to install

You install the tool in the terminal:

	gem install lastpass-ansible

## How to use

You must point Ansible to use `lastpass-ansible`:

	export ANSIBLE_VAULT_PASSWORD_FILE=`command -v lastpass-ansible`

Now assume you're in your web application directory:

	cd ~/Projects/my_web_app

To initialize everything, do:

	lastpass-ansible --init

This will create a new 30-character long password and put it in
`Ansible_Vault/my_web_app` LastPass hierarchy. If you want to "transfer" your vault
file `secrets.yml` to `lastpass-ansible`, copy the new password to clipboard:

	lpass show -c -p Ansible_Vault/my_web_app

And just re-key (change password) for your existing vault:

	ansible-vault rekey secrets.yml

Type your old password, and paste your new password.

File `.lastpass-ansible.conf` has been created along with the password. You
can remove this file if the hierarchy `Ansible_Vault/....` is fine with you.

## More details and custom settings

If you're a picky person and you don't like `Ansible_Vault` OR you want to
point `lastpass-ansible` to an existing hierarchy of your passwords, just stick it
to `.lastpass-ansible.conf`.  It's format is very easy:

	# lastpass-ansible configuration file. For more details read:
	# https://github.com/wkoszek/lastpass-ansible
	MyWebSites/my_web_app

The order of lookup for this LastPass site name is:

1. `.lastpass-ansible.conf` file
2. `LASTPASS_ANSIBLE_NAME` environment variable
3. Name guessed based on a directory: "Ansible_Vault" + name

It should be safe to commit `.lastpass-ansible.conf` to your repository.
If you're paranoid, just use `LASTPASS_ANSIBLE_NAME` environment variable
for passing this name. Otherwise just use the guessed name. I think it's the
most convenient.


## Summary

I used a shell-based equivalent of this flow for some time and it worked all
right.  The `lastpass-ansible` is my attempt to bring it to more people to
help with productivity. My hope is to improve this method by
exposing it to people and getting some criticism. Let me know if you find
bugs or issues here.

## GitHub

It's maintained in this GitHub repository:

[https://github.com/wkoszek/lastpass-ansible](https://github.com/wkoszek/lastpass-ansible)

[![Build Status](https://travis-ci.org/wkoszek/lastpass-ansible.svg?branch=master)](https://travis-ci.org/wkoszek/lastpass-ansible)

[Ansible Vault]: http://docs.ansible.com/ansible/playbooks_vault.html
[Ansible]: https://www.ansible.com
[LastPass]: https://www.lastpass.com
[command line client]: https://github.com/lastpass/lastpass-cli
[lastpass-ansible]: https://github.com/wkoszek/lastpass-ansible
[lastpass-ssh]: https://github.com/wkoszek/lastpass-ssh
