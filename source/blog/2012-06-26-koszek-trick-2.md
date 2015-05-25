---
title:	"Figuring out confusing assembly instructions &mdash; Koszek trick #2"
auth:	Wojciech Koszek
---

Todays post will be very simple, maybe trivial. One of the hacks that I came
up with, when I encountered confusing arcane of ANSI C, or when I played
with assembly for fun and profit.

Problem: isolate ANSI C construct or in-line assembly block, so that upon a
translation to intermediate assembly, block will be exposed more easily in a
visual manner.

So imagine you want to isolate memory reference within ANSI C and figure out
what the corresponding assembly line is. Assume given portion of the code:

	[ptr.c]

	#include <stdio.h>

	int
	main(int argc, char **argv)
	{
		const char *str = "example";
		char	 c;

		(void)argc;
		(void)argv;

		__asm__("/* -------- BEGIN ----------- */");
		c = str[3];
		__asm__("/* --------  END  ----------- */");
		printf("%c\n", c);

		return 0;
	}

Basically for a fixed literal string `example` you fetch its character `m`, which is
held in variable `c`. It doesn't make too much sense and isn't too useful,
but the technique has by all means real-world application.

Right now you perform:

	$ gcc -S ptr.c

And your created `ptr.s` suddenly has:

	
		.file	"ptr.c"
		.section	.rodata
	.LC0:
		.string	"example"
	.LC1:
		.string	"%c\n"
		.text
	.globl main
		.type	main, @function
	main:
	.LFB0:
		.cfi_startproc
		pushq	%rbp
		.cfi_def_cfa_offset 16
		movq	%rsp, %rbp
		.cfi_offset 6, -16
		.cfi_def_cfa_register 6
		subq	$32, %rsp
		movl	%edi, -20(%rbp)
		movq	%rsi, -32(%rbp)
		movq	$.LC0, -16(%rbp)
	#APP
	# 12 "ptr.c" 1
		/* -------- BEGIN ----------- */
	# 0 "" 2
	#NO_APP
		movq	-16(%rbp), %rax
		addq	$3, %rax
		movzbl	(%rax), %eax
		movb	%al, -1(%rbp)
	#APP
	# 14 "ptr.c" 1
		/* --------  END  ----------- */
	# 0 "" 2
	#NO_APP
		movsbl	-1(%rbp), %edx
		movl	$.LC1, %eax
		movl	%edx, %esi
		movq	%rax, %rdi
		movl	$0, %eax
		call	printf
		movl	$0, %eax
		leave
		.cfi_def_cfa 7, 8
		ret
		.cfi_endproc
	.LFE0:
		.size	main, .-main
		.ident	"GCC: (Ubuntu/Linaro 4.5.2-8ubuntu4) 4.5.2"
		.section	.note.GNU-stack,"",@progbits

As you can see, the comments placed by us through `__asm__` macro are
preserved in the intermediate assembly file. Ta-da!

If you have ever put a code, which has never been executed, or maybe even
disappeared somewhere deep in the sea of stages of compilation, this
technique should serve you well!

<iframe src="http://rcm.amazon.com/e/cm?lt1=_blank&bc1=FFFFFF&IS2=1&npa=1&bg1=FFFFFF&fc1=000000&lc1=000000&t=wojcadamkoszh-20&o=1&p=8&l=as4&m=amazon&f=ifr&ref=ss_til&asins=0131103628" style="width:120px;height:240px;" scrolling="no" marginwidth="0" marginheight="0" frameborder="0"></iframe>


<iframe src="http://rcm.amazon.com/e/cm?lt1=_blank&bc1=FFFFFF&IS2=1&npa=1&bg1=FFFFFF&fc1=000000&lc1=FF0000&t=wojcadamkoszh-20&o=1&p=8&l=as4&m=amazon&f=ifr&ref=ss_til&asins=0735619670" style="width:120px;height:240px;" scrolling="no" marginwidth="0" marginheight="0" frameborder="0"></iframe>

<iframe src="http://rcm.amazon.com/e/cm?lt1=_blank&bc1=FFFFFF&IS2=1&npa=1&bg1=FFFFFF&fc1=000000&lc1=FF0000&t=wojcadamkoszh-20&o=1&p=8&l=as4&m=amazon&f=ifr&ref=ss_til&asins=020161569X" style="width:120px;height:240px;" scrolling="no" marginwidth="0" marginheight="0" frameborder="0"></iframe>
