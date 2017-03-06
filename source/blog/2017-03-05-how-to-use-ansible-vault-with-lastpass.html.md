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

## Quick description of lastpass-ansible?

It's maintained in this GitHub repository:

[https://github.com/wkoszek/lastpass-ansible](https://github.com/wkoszek/lastpass-ansible)

Script `lastpass-ansible` in this project will let you unlock [Ansible
Vault][] with the password stored in [LastPass][]. This means you'll be able
to run `ansible-playbook` and `ansible-vault` commands without being
prompted for the password: it'll be taken from LastPass automatically.

## How to use?

Install the tool in the terminal:

~~~shell
gem install lastpass-ansible
~~~

To use it:

1. Generate a password in Ansible by adding a new site or secure note
2. Give it a name and save it.
3. Put the name of this site in `.lastpass-ansible.conf`

## Example

Let's create a "site" with a separate password:

![screenshot](/img/2017-03-05-how-to-use-ansible-vault-with-lastpass/lastpass_ansible.png)

In the top directory of your project:

~~~shell
$ pwd
/Users/wk/r/lnkr_xyz
~~~

You'd do:

~~~shell
echo ansible_vault_lnkr_xyz > .lastpass-ansible.conf
git add .lastpass-ansible.conf
git commit -m "Add lastpass-ansible config to the project" .lastpass-ansible.conf
~~~

The `lastpass-ansible` will take this name, and use `lpass` (the
LastPass [command line client][] utility) and lookup its database of password, then
pass it to Vault and unlock it.

If you don't want to use a file-based approach for some reason, you can pass
the name of the LastPass entry in the `LASTPASS_ANSIBLE_NAME` environment
variable. So for the example above you'd need to do:

~~~shell
export LASTPASS_ANSIBLE_NAME=ansible_vault_lnkr_xyz
~~~

somewhere in your flow. Let me know if it worked for you.

## Summary

I used a shell-based equivalent of this flow for some time and it worked all
right.  The `lastpass-ansible` is my attempt to bring it to more people to
help with productivity. My hope is to improve this method by
exposing it to people and getting some criticism. Let me know if you find
bugs or issues here.

[Ansible Vault]: http://docs.ansible.com/ansible/playbooks_vault.html
[Ansible]: https://www.ansible.com
[LastPass]: https://www.lastpass.com
[command line client]: https://github.com/lastpass/lastpass-cli
[lastpass-ansible]: https://github.com/wkoszek/lastpass-ansible
[lastpass-ssh]: https://github.com/wkoszek/lastpass-ssh
