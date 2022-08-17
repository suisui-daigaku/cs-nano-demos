	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 12, 0	sdk_version 12, 3
	.globl	_foo                            ## -- Begin function foo
	.p2align	4, 0x90
_foo:                                   ## @foo
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	_CounterFor_foo@GOTPCREL(%rip), %rax
	movl	(%rax), %eax
	addl	$1, %eax
	movq	_CounterFor_foo@GOTPCREL(%rip), %rcx
	movl	%eax, (%rcx)
	movb	$0, %al
	callq	_bar
	leaq	L_.str(%rip), %rdi
	movb	$0, %al
	callq	_printf
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_main                           ## -- Begin function main
	.p2align	4, 0x90
_main:                                  ## @main
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	_CounterFor_main@GOTPCREL(%rip), %rax
	movl	(%rax), %eax
	addl	$1, %eax
	movq	_CounterFor_main@GOTPCREL(%rip), %rcx
	movl	%eax, (%rcx)
	callq	_foo
	xorl	%eax, %eax
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_printf_wrapper                 ## -- Begin function printf_wrapper
	.p2align	4, 0x90
_printf_wrapper:                        ## @printf_wrapper
	.cfi_startproc
## %bb.0:                               ## %enter
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset %rbx, -16
	leaq	_ResultHeaderStrIR(%rip), %rdi
	xorl	%eax, %eax
	callq	_printf
	movq	_CounterFor_foo@GOTPCREL(%rip), %rax
	movl	(%rax), %edx
	leaq	_ResultFormatStrIR(%rip), %rbx
	leaq	L___unnamed_1(%rip), %rsi
	movq	%rbx, %rdi
	xorl	%eax, %eax
	callq	_printf
	movq	_CounterFor_main@GOTPCREL(%rip), %rax
	movl	(%rax), %edx
	leaq	L___unnamed_2(%rip), %rsi
	movq	%rbx, %rdi
	xorl	%eax, %eax
	callq	_printf
	popq	%rbx
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__cstring,cstring_literals
L_.str:                                 ## @.str
	.asciz	"foo\n"

	.comm	_CounterFor_foo,4,2             ## @CounterFor_foo
L___unnamed_1:                          ## @0
	.asciz	"foo"

	.comm	_CounterFor_main,4,2            ## @CounterFor_main
L___unnamed_2:                          ## @1
	.asciz	"main"

	.section	__DATA,__data
	.globl	_ResultFormatStrIR              ## @ResultFormatStrIR
_ResultFormatStrIR:
	.asciz	"%-20s %-10lu\n"

	.globl	_ResultHeaderStrIR              ## @ResultHeaderStrIR
	.p2align	4
_ResultHeaderStrIR:
	.asciz	"=================================================\nLLVM-TUTOR: dynamic analysis results\n=================================================\nNAME                 #N DIRECT CALLS\n-------------------------------------------------\n"

	.section	__DATA,__mod_term_func,mod_term_funcs
	.p2align	3
	.quad	_printf_wrapper
.subsections_via_symbols
