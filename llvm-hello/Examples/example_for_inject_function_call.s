	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 12, 0	sdk_version 12, 1
	.globl	_foo                            ## -- Begin function foo
	.p2align	4, 0x90
_foo:                                   ## @foo
	.cfi_startproc
## %bb.0:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset %ebp, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register %ebp
	movl	8(%ebp), %eax
	movl	8(%ebp), %eax
	shll	$1, %eax
	popl	%ebp
	retl
	.cfi_endproc
                                        ## -- End function
	.globl	_bar                            ## -- Begin function bar
	.p2align	4, 0x90
_bar:                                   ## @bar
	.cfi_startproc
## %bb.0:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset %ebp, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register %ebp
	pushl	%esi
	pushl	%eax
	.cfi_offset %esi, -12
	movl	12(%ebp), %eax
	movl	8(%ebp), %eax
	movl	8(%ebp), %esi
	movl	12(%ebp), %eax
	movl	%eax, (%esp)
	calll	_foo
	shll	$1, %eax
	addl	%eax, %esi
	movl	%esi, %eax
	addl	$4, %esp
	popl	%esi
	popl	%ebp
	retl
	.cfi_endproc
                                        ## -- End function
	.globl	_fez                            ## -- Begin function fez
	.p2align	4, 0x90
_fez:                                   ## @fez
	.cfi_startproc
## %bb.0:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset %ebp, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register %ebp
	pushl	%esi
	subl	$20, %esp
	.cfi_offset %esi, -12
	movl	16(%ebp), %eax
	movl	12(%ebp), %eax
	movl	8(%ebp), %eax
	movl	8(%ebp), %esi
	movl	8(%ebp), %eax
	movl	12(%ebp), %ecx
	movl	%eax, (%esp)
	movl	%ecx, 4(%esp)
	calll	_bar
	shll	$1, %eax
	addl	%eax, %esi
	imull	$3, 16(%ebp), %eax
	addl	%eax, %esi
	movl	%esi, %eax
	addl	$20, %esp
	popl	%esi
	popl	%ebp
	retl
	.cfi_endproc
                                        ## -- End function
	.globl	_main                           ## -- Begin function main
	.p2align	4, 0x90
_main:                                  ## @main
	.cfi_startproc
## %bb.0:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset %ebp, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register %ebp
	subl	$40, %esp
	movl	12(%ebp), %eax
	movl	8(%ebp), %ecx
	movl	$0, -20(%ebp)
	movl	%eax, -16(%ebp)
	movl	$123, -8(%ebp)
	movl	$0, -4(%ebp)
	movl	-8(%ebp), %eax
	movl	%eax, (%esp)
	calll	_foo
	addl	-4(%ebp), %eax
	movl	%eax, -4(%ebp)
	movl	-8(%ebp), %eax
	movl	-4(%ebp), %ecx
	movl	%eax, (%esp)
	movl	%ecx, 4(%esp)
	calll	_bar
	addl	-4(%ebp), %eax
	movl	%eax, -4(%ebp)
	movl	-8(%ebp), %eax
	movl	-4(%ebp), %ecx
	movl	%eax, (%esp)
	movl	%ecx, 4(%esp)
	movl	$123, 8(%esp)
	calll	_fez
	addl	-4(%ebp), %eax
	movl	%eax, -4(%ebp)
	xorl	%eax, %eax
	addl	$40, %esp
	popl	%ebp
	retl
	.cfi_endproc
                                        ## -- End function
.subsections_via_symbols
