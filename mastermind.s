	.file	"mastermind.c"
	.text
	.section	.rodata
.LC0:
	.string	"The code is "
.LC1:
	.string	"%d"
.LC2:
	.string	"Enter your code: "
.LC3:
	.string	"%4s"
.LC4:
	.string	"Correct"
.LC5:
	.string	"Incorrect"
	.align 8
.LC6:
	.string	"Number of correct digits is %d\n"
	.align 8
.LC7:
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
	subq	$64, %rsp
	movl	$0, -4(%rbp)
	movl	$0, -8(%rbp)
	movl	$0, %edi
	call	time@PLT
	movl	%eax, %edi
	call	srand@PLT
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
	movl	%eax, masterCode.0(%rip)
	movl	$1, -12(%rbp)
.L9:
	movb	$0, -13(%rbp)
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
	movl	%eax, -32(%rbp)
	movl	$0, -20(%rbp)
	jmp	.L2
.L5:
	movl	-20(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	masterCode.0(%rip), %rax
	movl	(%rdx,%rax), %eax
	cmpl	%eax, -32(%rbp)
	jne	.L3
	movb	$1, -13(%rbp)
	jmp	.L4
.L3:
	addl	$1, -20(%rbp)
.L2:
	movl	-20(%rbp), %eax
	cmpl	-12(%rbp), %eax
	jl	.L5
.L4:
	cmpb	$0, -13(%rbp)
	jne	.L17
	movl	-12(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rcx
	leaq	masterCode.0(%rip), %rdx
	movl	-32(%rbp), %eax
	movl	%eax, (%rcx,%rdx)
	addl	$1, -12(%rbp)
	cmpl	$4, -12(%rbp)
	je	.L18
	jmp	.L9
.L17:
	nop
	jmp	.L9
.L18:
	nop
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$0, -24(%rbp)
	jmp	.L10
.L11:
	movl	-24(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	masterCode.0(%rip), %rax
	movl	(%rdx,%rax), %eax
	movl	%eax, %esi
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	addl	$1, -24(%rbp)
.L10:
	cmpl	$3, -24(%rbp)
	jle	.L11
	movl	$10, %edi
	call	putchar@PLT
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-36(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC3(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	$0, -28(%rbp)
	jmp	.L12
.L15:
	movl	-28(%rbp), %eax
	cltq
	movzbl	-36(%rbp,%rax), %eax
	movsbl	%al, %eax
	leal	-48(%rax), %edx
	movl	-28(%rbp), %eax
	cltq
	movl	%edx, -64(%rbp,%rax,4)
	movl	-28(%rbp), %eax
	cltq
	movl	-64(%rbp,%rax,4), %edx
	movl	-28(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rcx
	leaq	masterCode.0(%rip), %rax
	movl	(%rcx,%rax), %eax
	cmpl	%eax, %edx
	jne	.L13
	leaq	.LC4(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	addl	$1, -4(%rbp)
	jmp	.L14
.L13:
	leaq	.LC5(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	addl	$1, -8(%rbp)
.L14:
	addl	$1, -28(%rbp)
.L12:
	cmpl	$3, -28(%rbp)
	jle	.L15
	movl	-4(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC6(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	-8(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC7(%rip), %rax
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
