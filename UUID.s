	.text
	.file	"UUID.bc"
	.globl	main
	.align	16, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# BB#0:
	pushq	%rbp
.Ltmp0:
	.cfi_def_cfa_offset 16
.Ltmp1:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp2:
	.cfi_def_cfa_register %rbp
	subq	$48, %rsp
	movl	$0, -4(%rbp)
	movl	$.L.str, %edi
	movl	$.L.str.1, %esi
	callq	fopen
	movq	%rax, -24(%rbp)
	testq	%rax, %rax
	je	.LBB0_2
# BB#1:
	movl	$.L.str.2, %edi
	movl	$.L.str.1, %esi
	callq	popen
	movq	%rax, -32(%rbp)
	movl	$buffer, %edi
	movl	$100, %esi
	movl	$1, %edx
	movq	%rax, %rcx
	callq	fread
	movq	$buffer, -16(%rbp)
	movl	$.L.str.3, %edi
	movl	$buffer, %esi
	xorl	%eax, %eax
	callq	printf
	movq	-24(%rbp), %rdi
	callq	fclose
.LBB0_2:
	cmpq	$0, -24(%rbp)
	jne	.LBB0_4
# BB#3:
	movl	$.L.str.4, %edi
	movl	$.L.str.1, %esi
	callq	popen
	movq	%rax, -40(%rbp)
	movl	$buffer, %edi
	movl	$100, %esi
	movl	$5, %edx
	movq	%rax, %rcx
	callq	fread
	movl	$.L.str, %edi
	movl	$.L.str.5, %esi
	callq	fopen
	movq	%rax, %rcx
	movq	%rcx, -48(%rbp)
	movl	$.L.str.6, %esi
	movl	$buffer, %edx
	xorl	%eax, %eax
	movq	%rcx, %rdi
	callq	fprintf
	movq	-48(%rbp), %rdi
	callq	fclose
	movq	-40(%rbp), %rdi
	callq	pclose
.LBB0_4:
	xorl	%eax, %eax
	addq	$48, %rsp
	popq	%rbp
	retq
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc

	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"cpuid.txt"
	.size	.L.str, 10

	.type	.L.str.1,@object        # @.str.1
.L.str.1:
	.asciz	"r"
	.size	.L.str.1, 2

	.type	.L.str.2,@object        # @.str.2
.L.str.2:
	.asciz	"sed -n 6p cpuid.txt"
	.size	.L.str.2, 20

	.type	buffer,@object          # @buffer
	.comm	buffer,20000,16
	.type	.L.str.3,@object        # @.str.3
.L.str.3:
	.asciz	"\n%s\n"
	.size	.L.str.3, 5

	.type	.L.str.4,@object        # @.str.4
.L.str.4:
	.asciz	"lsblk -o UUID"
	.size	.L.str.4, 14

	.type	.L.str.5,@object        # @.str.5
.L.str.5:
	.asciz	"w"
	.size	.L.str.5, 2

	.type	.L.str.6,@object        # @.str.6
.L.str.6:
	.asciz	"\n%s\n\n"
	.size	.L.str.6, 6

	.type	computer,@object        # @computer
	.comm	computer,8,8

	.ident	"clang version 3.8.0-2ubuntu4 (tags/RELEASE_380/final)"
	.section	".note.GNU-stack","",@progbits
