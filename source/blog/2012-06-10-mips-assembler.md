---
title:	"Cross-compile GNU assembler for MIPS"
description: "Building and using cross-compiled MIPS toolchain."
auth:	Wojciech Koszek
tags:	article
layout: layout_book
ads:
- <iframe src="http://rcm-na.amazon-adsystem.com/e/cm?lt1=_blank&bc1=FFFFFF&IS2=1&npa=1&bg1=FFFFFF&fc1=000000&lc1=FF0000&t=wkoszek-20&o=1&p=8&l=as4&m=amazon&f=ifr&ref=ss_til&asins=0120884216" style="width:120px;height:240px;" scrolling="no" marginwidth="0" marginheight="0" frameborder="0"></iframe>
- <iframe src="http://rcm-na.amazon-adsystem.com/e/cm?lt1=_blank&bc1=FFFFFF&IS2=1&npa=1&bg1=FFFFFF&fc1=000000&lc1=FF0000&t=wkoszek-20&o=1&p=8&l=as4&m=amazon&f=ifr&ref=ss_til&asins=0131420445" style="width:120px;height:240px;" scrolling="no" marginwidth="0" marginheight="0" frameborder="0"></iframe>
- <iframe src="http://rcm-na.amazon-adsystem.com/e/cm?lt1=_blank&bc1=FFFFFF&IS2=1&npa=1&bg1=FFFFFF&fc1=000000&lc1=FF0000&t=wkoszek-20&o=1&p=8&l=as4&m=amazon&f=ifr&ref=ss_til&asins=0123744938" style="width:120px;height:240px;" scrolling="no" marginwidth="0" marginheight="0" frameborder="0"></iframe>
- <iframe src="http://rcm-na.amazon-adsystem.com/e/cm?lt1=_blank&bc1=FFFFFF&IS2=1&npa=1&bg1=FFFFFF&fc1=000000&lc1=FF0C00&t=wkoszek-20&o=1&p=8&l=as4&m=amazon&f=ifr&ref=ss_til&asins=0123747503" style="width:120px;height:240px;" scrolling="no" marginwidth="0" marginheight="0" frameborder="0"></iframe>
spellcheck-allow:
- "opcodes"
---

Just a short note, not to have to walk through the Web each time I
want to get some strange opcodes generated.

Today "strange" means "MIPS". "Nobody uses MIPS", you say? Well -- I still believe MIPS
is the cleanest RISC architecture available today. So yes, I want to have
something translate:

	_start:
		addi	$2, $2, 123
		addi	$3, $3, 321
		add	$4, $2, $3

		addi	$5, $5, 1
		addi	$6, $6, 2
		or	$7, $5, $6

		addi	$8, $8, 0xf
		addi	$9, $9, 0x3
		and	$10, $8, $9

To:

	0x2042007b
	0x20630141
	0x00432020
	0x20a50001
	0x20c60002
	0x00a63825
	0x2108000f
	0x21290003
	0x01095024

For me. So first let me present steps for building the GNU assembler for
MIPS. Steps:

	wget ftp://sourceware.org/pub/binutils/snapshots/binutils-2.22.52.tar.bz2
	tar xjf binutils-2.22.52.tar.bz2
	cd binutils-2.22.52
	mkdir build
	../configure --target=mips --prefix=${HOME}/bin/mips
	make
	make install
	set path=($path ${HOME}/bin/mips/bin)

Now that I have MIPS assembler, I have created a simple `makefile` for
myself, which translates opcodes from generated object file to hexadecimal
opcodes:

	imem.hex: imem.s
		mips-as -o imem.o imem.s
		mips-objcopy -O binary imem.o imem.bin
		mips-objdump -d imem.o > imem.dump
		sed '1,7d' imem.dump | awk '{ print "0x"$$2 }' > imem.hex

Thanks to these several steps, I have a simple infrastructure to play with
MIPS opcodes.
