	.file	"mastermind.c"
	.text
	.section	.rodata
.LC0:
	.string	"Found %d\n"
.LC1:
	.string	"Master says %d\n"
.LC2:
	.string	"Duplicate found"
.LC3:
	.string	"idx is %d\n"
.LC4:
	.string	"The code is "
.LC5:
	.string	"%d"
.LC6:
	.string	"Enter your code: "
.LC7:
	.string	"%4s"
.LC8:
	.string	"Correct"
.LC9:
	.string	"Incorrect"
	.align 8
.LC10:
	.string	"Number of correct digits is %d\n"
	.align 8
.LC11:
	.string	"Number of incorrect digits is %d\n"
	.text
	.globl	run_game
	.type	run_game, @function
run_game:
.LFB6:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movl	$0, -4(%rbp)
	movl	$0, -8(%rbp)
	movl	$0, %edi
	call	time@PLT
	movl	%eax, %edi
	call	srand@PLT
	movl	$0, -12(%rbp)
.L5:
	call	rand@PLT
	movl	%eax, %edx
	movl	%edx, %eax
	sarl	$31, %eax
	shrl	$29, %eax
	addl	%eax, %edx
	andl	$7, %edx
	subl	%eax, %edx
	movl	%edx, %eax
	addl	$1, %eax
	movl	%eax, -24(%rbp)
	movl	-24(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	-12(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	masterCode.0(%rip), %rax
	movl	(%rdx,%rax), %eax
	movl	%eax, %esi
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	-12(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	masterCode.0(%rip), %rax
	movl	(%rdx,%rax), %eax
	cmpl	%eax, -24(%rbp)
	jne	.L2
	movl	-12(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rcx
	leaq	masterCode.0(%rip), %rdx
	movl	-24(%rbp), %eax
	movl	%eax, (%rcx,%rdx)
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L3
.L2:
	movl	-12(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rcx
	leaq	masterCode.0(%rip), %rdx
	movl	-24(%rbp), %eax
	movl	%eax, (%rcx,%rdx)
	addl	$1, -12(%rbp)
	movl	-12(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC3(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	cmpl	$4, -12(%rbp)
	je	.L12
	jmp	.L5
.L12:
	nop
.L3:
	leaq	.LC4(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$0, -16(%rbp)
	jmp	.L6
.L7:
	movl	-16(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	masterCode.0(%rip), %rax
	movl	(%rdx,%rax), %eax
	movl	%eax, %esi
	leaq	.LC5(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	addl	$1, -16(%rbp)
.L6:
	cmpl	$3, -16(%rbp)
	jle	.L7
	movl	$10, %edi
	call	putchar@PLT
	leaq	.LC6(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-28(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC7(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	$0, -20(%rbp)
	jmp	.L8
.L11:
	movl	-20(%rbp), %eax
	cltq
	movzbl	-28(%rbp,%rax), %eax
	movsbl	%al, %eax
	leal	-48(%rax), %edx
	movl	-20(%rbp), %eax
	cltq
	movl	%edx, -48(%rbp,%rax,4)
	movl	-20(%rbp), %eax
	cltq
	movl	-48(%rbp,%rax,4), %edx
	movl	-20(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rcx
	leaq	masterCode.0(%rip), %rax
	movl	(%rcx,%rax), %eax
	cmpl	%eax, %edx
	jne	.L9
	leaq	.LC8(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	addl	$1, -4(%rbp)
	jmp	.L10
.L9:
	leaq	.LC9(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	addl	$1, -8(%rbp)
.L10:
	addl	$1, -20(%rbp)
.L8:
	cmpl	$3, -20(%rbp)
	jle	.L11
	movl	-4(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC10(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	-8(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC11(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	run_game, .-run_game
	.globl	main
	.type	main, @function
main:
.LFB7:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	$0, %eax
	call	run_game
	movl	$0, %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	main, .-main
	.local	masterCode.0
	.comm	masterCode.0,16,16
	.ident	"GCC: (Debian 13.3.0-5) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
