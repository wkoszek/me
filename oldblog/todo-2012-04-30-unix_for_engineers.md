UNIX for engineers and scientists
---------------------------------
**by Wojciech Koszek**
%%inc/addthis.html%%

I was asked couple of times  to collect notes on productivity in \*nix systems, so I
thought: "Why don't I create a post about it?". 

This is a hard topic in general, since there's lots of lots of subjects
here. UNIX wasn't ever built as a easy to use system, but it's pretty damn
logical once you understand what it's all about.

So you're fortunate enough to have a pleasure to work on \*nix system, huh?
It not necessarily has to be a pleasure -- you might want to pick this darn
UNIX system that you were forced to use for the very hot task you were
assigned to.

Anyway..

My work requires me to spend a lot of time on GNU/Linux based system and
perform a lot of stuff by typing commands.

Yes, I know, I know. You're Windows user and you think it's a waste of time.
Sometimes indeed it is. Simply speaking: for certain things graphical
programs will be much better. For some, however, you need a way to have very
quick technique of performing tasks in a batch mode.

Batch means: no need to sit and do monkey-alike tasks, but writing small
tool for performing these tasks for you. 

This is possible in UNIX.

For the purpose of reference to myself and for the benefit of others, here
are 10 sets of commands that *you absolutely must know* if you're serious
about doing UNIX stuff on a daily basis.

If you're logged in on your system now, it's worth typing:

	cd ~

This will move you to your home directory.  Type:

	pwd

This should show you something line:

	/home/wkoszek

Or in general:

	/home/<user_name>

Depending how your system is configured.  I won't go in depth here, since
there's lots of more more concrete guides on shell commands, but anyway
here's general naming:

* Current directory:	`.`
* Upper directory	`..`
* You're home directory	`~`
* Main system directory	`/`

So:

	cd .

Doesn't move you anywhere.

	cd ..

Moves you to the directory "above" the current directory, e.g.: if:

	pwd

Returned:

	/home/wkoszek

Then:

	cd ..

Will move you to:

	/home

And:

	cd ..

To:

	/

Typing:

	cd /

Goes to the main system directory (you don't want that probably), and would
give you the same result, if typed from your home directory.

So you can get back:

	cd home

Typing:

	pwd

Now should show you:

	/home

And typing:

	cd wkoszek

Should give you

	/home/wkoszek

Now, if you do:

	cd ~
	
now, the rest of the commands here should be save to execute. This will let
you practice a bit as you read.

## File descriptors ##

This is a wide subject, but shortly speaking:

0.  Keyboard (so called: standard input, STDIN)
1.  Screen for normal messages (standard output, STDOUT)
2.  Screen for error messages (stadard error output, STDERR)

Note for (1) and (2): I purposely say "screen" - either physical screen, or
your graphical session can be a screen. Think of: where my junk shows up.

(Yes, these are numbers: you'll be forced to remember them).

Why?

Since UNIX works with a very simple concept in mind:

	read from standard input (0, STDIN)
	write on standard output (1, STDOUT)

Since in UNIX every program tries to read from keyboard:

	cat -n

(type some stuff in couple of lines, hit CTRL+D when finished -- this is
already pretty useful sometimes, isn't it?). You'll see what I mean later.

So how not to make input be a keyboard? Use magic < character:

	cat -n < /etc/hosts

So suddenly, for `/etc/hosts` file, you get magically and for free ... line
numbers.

UNIX will always try to write to STDOUT:

	cat -n < /etc/hosts

Will spit stuff on the screen for you. What if you want to save it? Use a
magic character > which redirects STDOUT to a file.

	cat -n < /etc/hosts > my_hosts_numbered

So in other words:

* `<` redirects STDIN and 'feeds' program on the left side with data on
  the right side

* `>` redirects STDOUT and will take data produced on the left side to the
 file on the right side of the `>`

Now: sometimes you may want to pass data from 1st program to 2nd program.
This is accomplished by:

	cat /etc/hosts | wc -l

(`wc -l` counts lines passed to the program). So `|` simply speaking makes
2nd program use STDOUT of the 1st program as it's STDIN. This is called a
pipe. 1st program produces data, white the 2nd program eats its data.

Summary: The way I think is: data flows from left to right if you see `|`
(pipes), since every program on the left side is producing data for the next
neighbor of the right. Use this rule unless you see `<>` characters. If you
see `>` or `<` treat them as arrows pointing you a direction of a data flow
in the command.

### touch

Creates empty file.

	touch empty

Will create empty.

### cat

Will read the file.

	cat empty

Will show you file ``empty``. Since it's empty, this shouldn't show you
anything. There's this thing that is called redirection of the output.

What ``cat`` really does it assumes you'll 

### vim/emacs

Mastering your editor is the biggest productivity improvement in my opinion.
It is interesting to see really experienced people using ``gedit`` or other
not-so-appropriate editors at work. For those unfamiliar: ``gedit`` on
GNU/Linux is like Notepad on Windows: you can't choose worse for typing
anything in that editor.

Editor on UNIX aren't the easiest thing to learn.

Yup. That's it. Such a basic thing as text editing is harder on UNIX. It's
because it's a known fact that more aggressive learning curve will
compensate your time in the boost of productivity.

I recommend ``vim``. Others use ``emacs``. They're basically the same, if
you spend long enough on learning them. Bear in mind: these are operating
systems with the side effect of text editing. Learn them if you have time.
If you don't, try something easier: ``mcedit``, ``pico``, ``ee``.

Short example: making new file ``new_file`` in ``vim`` is:

	vim new_file
	:
	wq

Making ``new_file2`` with ``I am a new file`` text in it is:

	vim new_file2
	i
	I am a new file
	<ESC>
	:wq

OK, you get the feeling. It's worth to study. I might want to devote
separate post to it. For now it's enough.

### mkdir, cd, pwd

These are very easy.

	mkdir my_new_directory
	cd my_new_directory
	pwd

Just try it. You won't break anything. So you get the feeling. To get back
to where you were, type:

	cd ..

``..`` means "directory in which I was before I typed ``cd``".

### ls, find

So lets make new directory ``new_dir`` and go there:

	mkdir new_dir
	cd new_dir

Wanna see what's in it? Type:

	ls

Now, lets practice some more:

	mkdir 1 2 3
	ls

Another excercise:

	mkdir 1/a 1/b 1/c
	mkdir 2/double 2/two 2/2nd

To see them from where you are:

	ls -d */*

``*`` means "of whichever name". Basically if a commands that you're typing
"see" the `*`, they'll do "Hmm... Star? What the hell? I don't know precisely
what that means. I'll show all possible entries".

Command ``ls`` is kind of special. The more you spend on getting it to work
for you, be better for you. 

You see I passed ``-d`` to ``ls``. These are flags. Anything that starts
with ``-`` means "Stuff that isn't about directories or files, but about
hints to the program". So nearly all UNIX programs support some form of
``-<whatever>`` that can sometimes modify how the program behave.

``ls`` has a lot of those, but to make you more productive, try:

	ls -a
	ls -la
	ls -lar

### tail, head

Show last and first lines of a file:

	tail -10 <file>

last lines of a file.

	head -10 <file>

Shows first 10 lines of a file.

### grep

This is too broad to cover here I think. Try to do simple:

	cat /etc/hosts first

and

	cat /etc/hosts | grep ^#

later. You'll see the difference.

### sort

### xargs

### wc

### sed

### awk
