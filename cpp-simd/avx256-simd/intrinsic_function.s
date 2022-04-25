	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 12, 0	sdk_version 12, 3
	.section	__TEXT,__const
	.p2align	5                               ## -- Begin function main
LCPI0_0:
	.quad	0x3ff0000000000000              ## double 1
	.quad	0x4000000000000000              ## double 2
	.quad	0x4008000000000000              ## double 3
	.quad	0x4010000000000000              ## double 4
LCPI0_1:
	.quad	0x4020000000000000              ## double 8
	.quad	0x401c000000000000              ## double 7
	.quad	0x4018000000000000              ## double 6
	.quad	0x4014000000000000              ## double 5
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_main
	.p2align	4, 0x90
_main:                                  ## @main
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	andq	$-32, %rsp
	subq	$224, %rsp
	movl	$0, 124(%rsp)
	vmovapd	LCPI0_0(%rip), %ymm0            ## ymm0 = [1.0E+0,2.0E+0,3.0E+0,4.0E+0]
	vmovapd	%ymm0, 64(%rsp)
	vmovapd	LCPI0_1(%rip), %ymm0            ## ymm0 = [8.0E+0,7.0E+0,6.0E+0,5.0E+0]
	vmovapd	%ymm0, 32(%rsp)
	vxorps	%xmm0, %xmm0, %xmm0
	vmovapd	%ymm0, (%rsp)
	vmovapd	64(%rsp), %ymm1
	vmovapd	32(%rsp), %ymm0
	vmovapd	%ymm1, 160(%rsp)
	vmovapd	%ymm0, 128(%rsp)
	vmovapd	160(%rsp), %ymm0
	vaddpd	128(%rsp), %ymm0, %ymm0
	vmovapd	%ymm0, (%rsp)
	xorl	%eax, %eax
	movq	%rbp, %rsp
	popq	%rbp
	vzeroupper
	retq
	.cfi_endproc
                                        ## -- End function
.subsections_via_symbols
