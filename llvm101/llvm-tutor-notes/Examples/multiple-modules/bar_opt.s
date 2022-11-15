	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 12, 0	sdk_version 12, 3
	.globl	_bar                            ## -- Begin function bar
	.p2align	4, 0x90
_bar:                                   ## @bar
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	_CounterFor_bar@GOTPCREL(%rip), %rax
	movl	(%rax), %eax
	addl	$1, %eax
	movq	_CounterFor_bar@GOTPCREL(%rip), %rcx
	movl	%eax, (%rcx)
	leaq	L_.str(%rip), %rdi
	movb	$0, %al
	callq	_printf
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_printf_wrapper                 ## -- Begin function printf_wrapper
	.p2align	4, 0x90
_printf_wrapper:                        ## @printf_wrapper
	.cfi_startproc
## %bb.0:                               ## %enter
	pushq	%rax
	.cfi_def_cfa_offset 16
	leaq	_ResultHeaderStrIR(%rip), %rdi
	xorl	%eax, %eax
	callq	_printf
	movq	_CounterFor_bar@GOTPCREL(%rip), %rax
	movl	(%rax), %edx
	leaq	_ResultFormatStrIR(%rip), %rdi
	leaq	L___unnamed_1(%rip), %rsi
	xorl	%eax, %eax
	callq	_printf
	popq	%rax
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__cstring,cstring_literals
L_.str:                                 ## @.str
	.asciz	"bar\n"

	.comm	_CounterFor_bar,4,2             ## @CounterFor_bar
L___unnamed_1:                          ## @0
	.asciz	"bar"

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
