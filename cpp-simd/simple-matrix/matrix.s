	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 12, 0	sdk_version 12, 1
	.file	1 "/usr/local/lib/clang/14.0.0/include" "emmintrin.h"
	.section	__TEXT,__literal8,8byte_literals
	.p2align	3                               ## -- Begin function main
LCPI0_0:
	.quad	0x4010000000000000              ## double 4
LCPI0_1:
	.quad	0x4008000000000000              ## double 3
LCPI0_2:
	.quad	0x4000000000000000              ## double 2
LCPI0_3:
	.quad	0x3ff0000000000000              ## double 1
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_main
	.p2align	4, 0x90
_main:                                  ## @main
Lfunc_begin0:
	.file	2 "/Users/haohua/Documents/GitHub/cs-nano-projects/cpp-simd/simple-matrix" "matrix.c"
	.loc	2 9 0                           ## matrix.c:9:0
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$512, %rsp                      ## imm = 0x200
	movq	___stack_chk_guard@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, -8(%rbp)
	movl	$0, -248(%rbp)
	movl	%edi, -244(%rbp)
	movq	%rsi, -504(%rbp)
Ltmp0:
	.loc	2 15 15 prologue_end            ## matrix.c:15:15
	movl	$2, -240(%rbp)
	.loc	2 16 15                         ## matrix.c:16:15
	movl	$2, -236(%rbp)
	.loc	2 17 9                          ## matrix.c:17:9
	movl	$0, -116(%rbp)
	.loc	2 21 10                         ## matrix.c:21:10
	movsd	LCPI0_3(%rip), %xmm0            ## xmm0 = mem[0],zero
	movsd	%xmm0, -48(%rbp)
	.loc	2 21 22 is_stmt 0               ## matrix.c:21:22
	xorps	%xmm0, %xmm0
	movsd	%xmm0, -40(%rbp)
	.loc	2 21 34                         ## matrix.c:21:34
	xorps	%xmm0, %xmm0
	movsd	%xmm0, -32(%rbp)
	.loc	2 21 46                         ## matrix.c:21:46
	movsd	LCPI0_3(%rip), %xmm0            ## xmm0 = mem[0],zero
	movsd	%xmm0, -24(%rbp)
	.loc	2 23 10 is_stmt 1               ## matrix.c:23:10
	movsd	LCPI0_3(%rip), %xmm0            ## xmm0 = mem[0],zero
	movsd	%xmm0, -80(%rbp)
	.loc	2 23 22 is_stmt 0               ## matrix.c:23:22
	movsd	LCPI0_2(%rip), %xmm0            ## xmm0 = mem[0],zero
	movsd	%xmm0, -72(%rbp)
	.loc	2 23 34                         ## matrix.c:23:34
	movsd	LCPI0_1(%rip), %xmm0            ## xmm0 = mem[0],zero
	movsd	%xmm0, -64(%rbp)
	.loc	2 23 46                         ## matrix.c:23:46
	movsd	LCPI0_0(%rip), %xmm0            ## xmm0 = mem[0],zero
	movsd	%xmm0, -56(%rbp)
	.loc	2 25 10 is_stmt 1               ## matrix.c:25:10
	xorps	%xmm0, %xmm0
	movsd	%xmm0, -112(%rbp)
	.loc	2 25 22 is_stmt 0               ## matrix.c:25:22
	xorps	%xmm0, %xmm0
	movsd	%xmm0, -104(%rbp)
	.loc	2 25 34                         ## matrix.c:25:34
	xorps	%xmm0, %xmm0
	movsd	%xmm0, -96(%rbp)
	.loc	2 25 46                         ## matrix.c:25:46
	xorps	%xmm0, %xmm0
	movsd	%xmm0, -88(%rbp)
	.loc	2 28 22 is_stmt 1               ## matrix.c:28:22
	leaq	-112(%rbp), %rax
	.loc	2 28 10 is_stmt 0               ## matrix.c:28:10
	movq	%rax, -184(%rbp)
	movq	-184(%rbp), %rax
	movapd	(%rax), %xmm0
	.loc	2 28 8                          ## matrix.c:28:8
	movapd	%xmm0, -160(%rbp)
	.loc	2 29 22 is_stmt 1               ## matrix.c:29:22
	leaq	-112(%rbp), %rax
	.loc	2 29 23 is_stmt 0               ## matrix.c:29:23
	addq	$16, %rax
	.loc	2 29 10                         ## matrix.c:29:10
	movq	%rax, -176(%rbp)
	movq	-176(%rbp), %rax
	movapd	(%rax), %xmm0
	.loc	2 29 8                          ## matrix.c:29:8
	movapd	%xmm0, -144(%rbp)
Ltmp1:
	.loc	2 31 12 is_stmt 1               ## matrix.c:31:12
	movl	$0, -116(%rbp)
LBB0_1:                                 ## =>This Inner Loop Header: Depth=1
Ltmp2:
	.loc	2 31 19 is_stmt 0               ## matrix.c:31:19
	cmpl	$2, -116(%rbp)
Ltmp3:
	.loc	2 31 5                          ## matrix.c:31:5
	jge	LBB0_4
## %bb.2:                               ##   in Loop: Header=BB0_1 Depth=1
Ltmp4:
	.loc	2 32 27 is_stmt 1               ## matrix.c:32:27
	movl	-116(%rbp), %eax
	.loc	2 32 28 is_stmt 0               ## matrix.c:32:28
	addl	%eax, %eax
	.loc	2 32 26                         ## matrix.c:32:26
	cltq
	leaq	-48(%rbp,%rax,8), %rax
	.loc	2 32 13                         ## matrix.c:32:13
	movq	%rax, -168(%rbp)
	movq	-168(%rbp), %rax
	movapd	(%rax), %xmm0
	.loc	2 32 11                         ## matrix.c:32:11
	movapd	%xmm0, -272(%rbp)
	.loc	2 33 29 is_stmt 1               ## matrix.c:33:29
	movslq	-116(%rbp), %rax
	.loc	2 33 28 is_stmt 0               ## matrix.c:33:28
	leaq	-80(%rbp,%rax,8), %rax
	.loc	2 33 14                         ## matrix.c:33:14
	movq	%rax, -216(%rbp)
	movq	-216(%rbp), %rax
	movsd	(%rax), %xmm0                   ## xmm0 = mem[0],zero
	movsd	%xmm0, -208(%rbp)
	movsd	-208(%rbp), %xmm0               ## xmm0 = mem[0],zero
	movddup	%xmm0, %xmm0                    ## xmm0 = xmm0[0,0]
	movapd	%xmm0, -336(%rbp)
	movapd	-336(%rbp), %xmm0
	.loc	2 33 12                         ## matrix.c:33:12
	movapd	%xmm0, -304(%rbp)
	.loc	2 34 29 is_stmt 1               ## matrix.c:34:29
	movslq	-116(%rbp), %rax
	.loc	2 34 30 is_stmt 0               ## matrix.c:34:30
	leaq	-64(%rbp,%rax,8), %rax
	.loc	2 34 14                         ## matrix.c:34:14
	movq	%rax, -200(%rbp)
	movq	-200(%rbp), %rax
	movsd	(%rax), %xmm0                   ## xmm0 = mem[0],zero
	movsd	%xmm0, -192(%rbp)
	movsd	-192(%rbp), %xmm0               ## xmm0 = mem[0],zero
	movddup	%xmm0, %xmm0                    ## xmm0 = xmm0[0,0]
	movapd	%xmm0, -320(%rbp)
	movapd	-320(%rbp), %xmm0
	.loc	2 34 12                         ## matrix.c:34:12
	movapd	%xmm0, -288(%rbp)
	.loc	2 35 25 is_stmt 1               ## matrix.c:35:25
	movapd	-160(%rbp), %xmm0
	.loc	2 35 40 is_stmt 0               ## matrix.c:35:40
	movapd	-272(%rbp), %xmm1
	.loc	2 35 43                         ## matrix.c:35:43
	movapd	-304(%rbp), %xmm2
	.loc	2 35 29                         ## matrix.c:35:29
	movapd	%xmm1, -464(%rbp)
	movapd	%xmm2, -448(%rbp)
	movapd	-464(%rbp), %xmm1
	mulpd	-448(%rbp), %xmm1
	.loc	2 35 14                         ## matrix.c:35:14
	movapd	%xmm0, -400(%rbp)
	movapd	%xmm1, -384(%rbp)
	movapd	-400(%rbp), %xmm0
	addpd	-384(%rbp), %xmm0
	.loc	2 35 12                         ## matrix.c:35:12
	movapd	%xmm0, -160(%rbp)
	.loc	2 36 25 is_stmt 1               ## matrix.c:36:25
	movapd	-144(%rbp), %xmm0
	.loc	2 36 40 is_stmt 0               ## matrix.c:36:40
	movapd	-272(%rbp), %xmm1
	.loc	2 36 43                         ## matrix.c:36:43
	movapd	-288(%rbp), %xmm2
	.loc	2 36 29                         ## matrix.c:36:29
	movapd	%xmm1, -432(%rbp)
	movapd	%xmm2, -416(%rbp)
	movapd	-432(%rbp), %xmm1
	mulpd	-416(%rbp), %xmm1
	.loc	2 36 14                         ## matrix.c:36:14
	movapd	%xmm0, -368(%rbp)
	movapd	%xmm1, -352(%rbp)
	movapd	-368(%rbp), %xmm0
	addpd	-352(%rbp), %xmm0
	.loc	2 36 12                         ## matrix.c:36:12
	movapd	%xmm0, -144(%rbp)
Ltmp5:
## %bb.3:                               ##   in Loop: Header=BB0_1 Depth=1
	.loc	2 31 25 is_stmt 1               ## matrix.c:31:25
	movl	-116(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -116(%rbp)
	.loc	2 31 5 is_stmt 0                ## matrix.c:31:5
	jmp	LBB0_1
Ltmp6:
LBB0_4:
	.loc	2 39 18 is_stmt 1               ## matrix.c:39:18
	leaq	-112(%rbp), %rax
	.loc	2 39 25 is_stmt 0               ## matrix.c:39:25
	movapd	-160(%rbp), %xmm0
	.loc	2 39 5                          ## matrix.c:39:5
	movq	%rax, -232(%rbp)
	movapd	%xmm0, -496(%rbp)
	movapd	-496(%rbp), %xmm0
	movq	-232(%rbp), %rax
	movapd	%xmm0, (%rax)
	.loc	2 40 18 is_stmt 1               ## matrix.c:40:18
	leaq	-112(%rbp), %rax
	.loc	2 40 19 is_stmt 0               ## matrix.c:40:19
	addq	$16, %rax
	.loc	2 40 25                         ## matrix.c:40:25
	movapd	-144(%rbp), %xmm0
	.loc	2 40 5                          ## matrix.c:40:5
	movq	%rax, -224(%rbp)
	movapd	%xmm0, -480(%rbp)
	movapd	-480(%rbp), %xmm0
	movq	-224(%rbp), %rax
	movapd	%xmm0, (%rax)
	.loc	2 42 32 is_stmt 1               ## matrix.c:42:32
	movsd	-112(%rbp), %xmm0               ## xmm0 = mem[0],zero
	.loc	2 42 38 is_stmt 0               ## matrix.c:42:38
	movsd	-96(%rbp), %xmm1                ## xmm1 = mem[0],zero
	.loc	2 42 44                         ## matrix.c:42:44
	movsd	-104(%rbp), %xmm2               ## xmm2 = mem[0],zero
	.loc	2 42 50                         ## matrix.c:42:50
	movsd	-88(%rbp), %xmm3                ## xmm3 = mem[0],zero
	.loc	2 42 5                          ## matrix.c:42:5
	leaq	L_.str(%rip), %rdi
	movb	$4, %al
	callq	_printf
	movq	-8(%rbp), %rax
	movq	___stack_chk_guard@GOTPCREL(%rip), %rcx
	movq	(%rcx), %rcx
	subq	%rax, %rcx
	jne	LBB0_5
	jmp	LBB0_6
LBB0_5:
	.loc	2 0 5                           ## matrix.c:0:5
	callq	___stack_chk_fail
LBB0_6:
	.loc	2 44 5 is_stmt 1                ## matrix.c:44:5
	xorl	%eax, %eax
	addq	$512, %rsp                      ## imm = 0x200
	popq	%rbp
	retq
Ltmp7:
Lfunc_end0:
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__cstring,cstring_literals
L_.str:                                 ## @.str
	.asciz	"%g, %g\n%g, %g\n"

	.section	__DWARF,__debug_abbrev,regular,debug
Lsection_abbrev:
	.byte	1                               ## Abbreviation Code
	.byte	17                              ## DW_TAG_compile_unit
	.byte	1                               ## DW_CHILDREN_yes
	.byte	37                              ## DW_AT_producer
	.byte	14                              ## DW_FORM_strp
	.byte	19                              ## DW_AT_language
	.byte	5                               ## DW_FORM_data2
	.byte	3                               ## DW_AT_name
	.byte	14                              ## DW_FORM_strp
	.ascii	"\202|"                         ## DW_AT_LLVM_sysroot
	.byte	14                              ## DW_FORM_strp
	.ascii	"\357\177"                      ## DW_AT_APPLE_sdk
	.byte	14                              ## DW_FORM_strp
	.byte	16                              ## DW_AT_stmt_list
	.byte	23                              ## DW_FORM_sec_offset
	.byte	27                              ## DW_AT_comp_dir
	.byte	14                              ## DW_FORM_strp
	.byte	17                              ## DW_AT_low_pc
	.byte	1                               ## DW_FORM_addr
	.byte	18                              ## DW_AT_high_pc
	.byte	6                               ## DW_FORM_data4
	.byte	0                               ## EOM(1)
	.byte	0                               ## EOM(2)
	.byte	2                               ## Abbreviation Code
	.byte	15                              ## DW_TAG_pointer_type
	.byte	0                               ## DW_CHILDREN_no
	.byte	73                              ## DW_AT_type
	.byte	19                              ## DW_FORM_ref4
	.byte	0                               ## EOM(1)
	.byte	0                               ## EOM(2)
	.byte	3                               ## Abbreviation Code
	.byte	38                              ## DW_TAG_const_type
	.byte	0                               ## DW_CHILDREN_no
	.byte	73                              ## DW_AT_type
	.byte	19                              ## DW_FORM_ref4
	.byte	0                               ## EOM(1)
	.byte	0                               ## EOM(2)
	.byte	4                               ## Abbreviation Code
	.byte	22                              ## DW_TAG_typedef
	.byte	0                               ## DW_CHILDREN_no
	.byte	73                              ## DW_AT_type
	.byte	19                              ## DW_FORM_ref4
	.byte	3                               ## DW_AT_name
	.byte	14                              ## DW_FORM_strp
	.byte	58                              ## DW_AT_decl_file
	.byte	11                              ## DW_FORM_data1
	.byte	59                              ## DW_AT_decl_line
	.byte	11                              ## DW_FORM_data1
	.byte	0                               ## EOM(1)
	.byte	0                               ## EOM(2)
	.byte	5                               ## Abbreviation Code
	.byte	1                               ## DW_TAG_array_type
	.byte	1                               ## DW_CHILDREN_yes
	.ascii	"\207B"                         ## DW_AT_GNU_vector
	.byte	25                              ## DW_FORM_flag_present
	.byte	73                              ## DW_AT_type
	.byte	19                              ## DW_FORM_ref4
	.byte	0                               ## EOM(1)
	.byte	0                               ## EOM(2)
	.byte	6                               ## Abbreviation Code
	.byte	33                              ## DW_TAG_subrange_type
	.byte	0                               ## DW_CHILDREN_no
	.byte	73                              ## DW_AT_type
	.byte	19                              ## DW_FORM_ref4
	.byte	55                              ## DW_AT_count
	.byte	11                              ## DW_FORM_data1
	.byte	0                               ## EOM(1)
	.byte	0                               ## EOM(2)
	.byte	7                               ## Abbreviation Code
	.byte	36                              ## DW_TAG_base_type
	.byte	0                               ## DW_CHILDREN_no
	.byte	3                               ## DW_AT_name
	.byte	14                              ## DW_FORM_strp
	.byte	62                              ## DW_AT_encoding
	.byte	11                              ## DW_FORM_data1
	.byte	11                              ## DW_AT_byte_size
	.byte	11                              ## DW_FORM_data1
	.byte	0                               ## EOM(1)
	.byte	0                               ## EOM(2)
	.byte	8                               ## Abbreviation Code
	.byte	36                              ## DW_TAG_base_type
	.byte	0                               ## DW_CHILDREN_no
	.byte	3                               ## DW_AT_name
	.byte	14                              ## DW_FORM_strp
	.byte	11                              ## DW_AT_byte_size
	.byte	11                              ## DW_FORM_data1
	.byte	62                              ## DW_AT_encoding
	.byte	11                              ## DW_FORM_data1
	.byte	0                               ## EOM(1)
	.byte	0                               ## EOM(2)
	.byte	9                               ## Abbreviation Code
	.byte	19                              ## DW_TAG_structure_type
	.byte	1                               ## DW_CHILDREN_yes
	.byte	3                               ## DW_AT_name
	.byte	14                              ## DW_FORM_strp
	.byte	11                              ## DW_AT_byte_size
	.byte	11                              ## DW_FORM_data1
	.byte	58                              ## DW_AT_decl_file
	.byte	11                              ## DW_FORM_data1
	.byte	59                              ## DW_AT_decl_line
	.byte	5                               ## DW_FORM_data2
	.byte	0                               ## EOM(1)
	.byte	0                               ## EOM(2)
	.byte	10                              ## Abbreviation Code
	.byte	13                              ## DW_TAG_member
	.byte	0                               ## DW_CHILDREN_no
	.byte	3                               ## DW_AT_name
	.byte	14                              ## DW_FORM_strp
	.byte	73                              ## DW_AT_type
	.byte	19                              ## DW_FORM_ref4
	.byte	58                              ## DW_AT_decl_file
	.byte	11                              ## DW_FORM_data1
	.byte	59                              ## DW_AT_decl_line
	.byte	5                               ## DW_FORM_data2
	.byte	56                              ## DW_AT_data_member_location
	.byte	11                              ## DW_FORM_data1
	.byte	0                               ## EOM(1)
	.byte	0                               ## EOM(2)
	.byte	11                              ## Abbreviation Code
	.byte	46                              ## DW_TAG_subprogram
	.byte	1                               ## DW_CHILDREN_yes
	.byte	17                              ## DW_AT_low_pc
	.byte	1                               ## DW_FORM_addr
	.byte	18                              ## DW_AT_high_pc
	.byte	6                               ## DW_FORM_data4
	.byte	64                              ## DW_AT_frame_base
	.byte	24                              ## DW_FORM_exprloc
	.byte	3                               ## DW_AT_name
	.byte	14                              ## DW_FORM_strp
	.byte	58                              ## DW_AT_decl_file
	.byte	11                              ## DW_FORM_data1
	.byte	59                              ## DW_AT_decl_line
	.byte	11                              ## DW_FORM_data1
	.byte	39                              ## DW_AT_prototyped
	.byte	25                              ## DW_FORM_flag_present
	.byte	73                              ## DW_AT_type
	.byte	19                              ## DW_FORM_ref4
	.byte	63                              ## DW_AT_external
	.byte	25                              ## DW_FORM_flag_present
	.byte	0                               ## EOM(1)
	.byte	0                               ## EOM(2)
	.byte	12                              ## Abbreviation Code
	.byte	5                               ## DW_TAG_formal_parameter
	.byte	0                               ## DW_CHILDREN_no
	.byte	2                               ## DW_AT_location
	.byte	24                              ## DW_FORM_exprloc
	.byte	3                               ## DW_AT_name
	.byte	14                              ## DW_FORM_strp
	.byte	58                              ## DW_AT_decl_file
	.byte	11                              ## DW_FORM_data1
	.byte	59                              ## DW_AT_decl_line
	.byte	11                              ## DW_FORM_data1
	.byte	73                              ## DW_AT_type
	.byte	19                              ## DW_FORM_ref4
	.byte	0                               ## EOM(1)
	.byte	0                               ## EOM(2)
	.byte	13                              ## Abbreviation Code
	.byte	52                              ## DW_TAG_variable
	.byte	0                               ## DW_CHILDREN_no
	.byte	2                               ## DW_AT_location
	.byte	24                              ## DW_FORM_exprloc
	.byte	3                               ## DW_AT_name
	.byte	14                              ## DW_FORM_strp
	.ascii	"\210\001"                      ## DW_AT_alignment
	.byte	15                              ## DW_FORM_udata
	.byte	58                              ## DW_AT_decl_file
	.byte	11                              ## DW_FORM_data1
	.byte	59                              ## DW_AT_decl_line
	.byte	11                              ## DW_FORM_data1
	.byte	73                              ## DW_AT_type
	.byte	19                              ## DW_FORM_ref4
	.byte	0                               ## EOM(1)
	.byte	0                               ## EOM(2)
	.byte	14                              ## Abbreviation Code
	.byte	52                              ## DW_TAG_variable
	.byte	0                               ## DW_CHILDREN_no
	.byte	2                               ## DW_AT_location
	.byte	24                              ## DW_FORM_exprloc
	.byte	3                               ## DW_AT_name
	.byte	14                              ## DW_FORM_strp
	.byte	58                              ## DW_AT_decl_file
	.byte	11                              ## DW_FORM_data1
	.byte	59                              ## DW_AT_decl_line
	.byte	11                              ## DW_FORM_data1
	.byte	73                              ## DW_AT_type
	.byte	19                              ## DW_FORM_ref4
	.byte	0                               ## EOM(1)
	.byte	0                               ## EOM(2)
	.byte	15                              ## Abbreviation Code
	.byte	1                               ## DW_TAG_array_type
	.byte	1                               ## DW_CHILDREN_yes
	.byte	73                              ## DW_AT_type
	.byte	19                              ## DW_FORM_ref4
	.byte	0                               ## EOM(1)
	.byte	0                               ## EOM(2)
	.byte	0                               ## EOM(3)
	.section	__DWARF,__debug_info,regular,debug
Lsection_info:
Lcu_begin0:
.set Lset0, Ldebug_info_end0-Ldebug_info_start0 ## Length of Unit
	.long	Lset0
Ldebug_info_start0:
	.short	4                               ## DWARF version number
.set Lset1, Lsection_abbrev-Lsection_abbrev ## Offset Into Abbrev. Section
	.long	Lset1
	.byte	8                               ## Address Size (in bytes)
	.byte	1                               ## Abbrev [1] 0xb:0x190 DW_TAG_compile_unit
	.long	0                               ## DW_AT_producer
	.short	12                              ## DW_AT_language
	.long	105                             ## DW_AT_name
	.long	114                             ## DW_AT_LLVM_sysroot
	.long	213                             ## DW_AT_APPLE_sdk
.set Lset2, Lline_table_start0-Lsection_line ## DW_AT_stmt_list
	.long	Lset2
	.long	228                             ## DW_AT_comp_dir
	.quad	Lfunc_begin0                    ## DW_AT_low_pc
.set Lset3, Lfunc_end0-Lfunc_begin0     ## DW_AT_high_pc
	.long	Lset3
	.byte	2                               ## Abbrev [2] 0x32:0x5 DW_TAG_pointer_type
	.long	55                              ## DW_AT_type
	.byte	3                               ## Abbrev [3] 0x37:0x5 DW_TAG_const_type
	.long	60                              ## DW_AT_type
	.byte	4                               ## Abbrev [4] 0x3c:0xb DW_TAG_typedef
	.long	71                              ## DW_AT_type
	.long	299                             ## DW_AT_name
	.byte	1                               ## DW_AT_decl_file
	.byte	19                              ## DW_AT_decl_line
	.byte	5                               ## Abbrev [5] 0x47:0xc DW_TAG_array_type
                                        ## DW_AT_GNU_vector
	.long	83                              ## DW_AT_type
	.byte	6                               ## Abbrev [6] 0x4c:0x6 DW_TAG_subrange_type
	.long	90                              ## DW_AT_type
	.byte	2                               ## DW_AT_count
	.byte	0                               ## End Of Children Mark
	.byte	7                               ## Abbrev [7] 0x53:0x7 DW_TAG_base_type
	.long	307                             ## DW_AT_name
	.byte	4                               ## DW_AT_encoding
	.byte	8                               ## DW_AT_byte_size
	.byte	8                               ## Abbrev [8] 0x5a:0x7 DW_TAG_base_type
	.long	314                             ## DW_AT_name
	.byte	8                               ## DW_AT_byte_size
	.byte	7                               ## DW_AT_encoding
	.byte	2                               ## Abbrev [2] 0x61:0x5 DW_TAG_pointer_type
	.long	102                             ## DW_AT_type
	.byte	3                               ## Abbrev [3] 0x66:0x5 DW_TAG_const_type
	.long	107                             ## DW_AT_type
	.byte	9                               ## Abbrev [9] 0x6b:0x17 DW_TAG_structure_type
	.long	334                             ## DW_AT_name
	.byte	8                               ## DW_AT_byte_size
	.byte	1                               ## DW_AT_decl_file
	.short	1603                            ## DW_AT_decl_line
	.byte	10                              ## Abbrev [10] 0x74:0xd DW_TAG_member
	.long	355                             ## DW_AT_name
	.long	83                              ## DW_AT_type
	.byte	1                               ## DW_AT_decl_file
	.short	1604                            ## DW_AT_decl_line
	.byte	0                               ## DW_AT_data_member_location
	.byte	0                               ## End Of Children Mark
	.byte	4                               ## Abbrev [4] 0x82:0xb DW_TAG_typedef
	.long	71                              ## DW_AT_type
	.long	359                             ## DW_AT_name
	.byte	1                               ## DW_AT_decl_file
	.byte	26                              ## DW_AT_decl_line
	.byte	2                               ## Abbrev [2] 0x8d:0x5 DW_TAG_pointer_type
	.long	60                              ## DW_AT_type
	.byte	11                              ## Abbrev [11] 0x92:0xdf DW_TAG_subprogram
	.quad	Lfunc_begin0                    ## DW_AT_low_pc
.set Lset4, Lfunc_end0-Lfunc_begin0     ## DW_AT_high_pc
	.long	Lset4
	.byte	1                               ## DW_AT_frame_base
	.byte	86
	.long	366                             ## DW_AT_name
	.byte	2                               ## DW_AT_decl_file
	.byte	9                               ## DW_AT_decl_line
                                        ## DW_AT_prototyped
	.long	369                             ## DW_AT_type
                                        ## DW_AT_external
	.byte	12                              ## Abbrev [12] 0xab:0xf DW_TAG_formal_parameter
	.byte	3                               ## DW_AT_location
	.byte	145
	.ascii	"\214~"
	.long	375                             ## DW_AT_name
	.byte	2                               ## DW_AT_decl_file
	.byte	9                               ## DW_AT_decl_line
	.long	369                             ## DW_AT_type
	.byte	12                              ## Abbrev [12] 0xba:0xf DW_TAG_formal_parameter
	.byte	3                               ## DW_AT_location
	.byte	145
	.ascii	"\210|"
	.long	380                             ## DW_AT_name
	.byte	2                               ## DW_AT_decl_file
	.byte	9                               ## DW_AT_decl_line
	.long	376                             ## DW_AT_type
	.byte	13                              ## Abbrev [13] 0xc9:0xf DW_TAG_variable
	.byte	2                               ## DW_AT_location
	.byte	145
	.byte	80
	.long	390                             ## DW_AT_name
	.byte	16                              ## DW_AT_alignment
	.byte	2                               ## DW_AT_decl_file
	.byte	11                              ## DW_AT_decl_line
	.long	393                             ## DW_AT_type
	.byte	13                              ## Abbrev [13] 0xd8:0x10 DW_TAG_variable
	.byte	3                               ## DW_AT_location
	.byte	145
	.ascii	"\260\177"
	.long	392                             ## DW_AT_name
	.byte	16                              ## DW_AT_alignment
	.byte	2                               ## DW_AT_decl_file
	.byte	12                              ## DW_AT_decl_line
	.long	393                             ## DW_AT_type
	.byte	13                              ## Abbrev [13] 0xe8:0x10 DW_TAG_variable
	.byte	3                               ## DW_AT_location
	.byte	145
	.ascii	"\220\177"
	.long	394                             ## DW_AT_name
	.byte	16                              ## DW_AT_alignment
	.byte	2                               ## DW_AT_decl_file
	.byte	13                              ## DW_AT_decl_line
	.long	393                             ## DW_AT_type
	.byte	14                              ## Abbrev [14] 0xf8:0xf DW_TAG_variable
	.byte	3                               ## DW_AT_location
	.byte	145
	.ascii	"\220~"
	.long	396                             ## DW_AT_name
	.byte	2                               ## DW_AT_decl_file
	.byte	15                              ## DW_AT_decl_line
	.long	405                             ## DW_AT_type
	.byte	14                              ## Abbrev [14] 0x107:0xf DW_TAG_variable
	.byte	3                               ## DW_AT_location
	.byte	145
	.ascii	"\224~"
	.long	398                             ## DW_AT_name
	.byte	2                               ## DW_AT_decl_file
	.byte	16                              ## DW_AT_decl_line
	.long	405                             ## DW_AT_type
	.byte	14                              ## Abbrev [14] 0x116:0xf DW_TAG_variable
	.byte	3                               ## DW_AT_location
	.byte	145
	.ascii	"\214\177"
	.long	400                             ## DW_AT_name
	.byte	2                               ## DW_AT_decl_file
	.byte	17                              ## DW_AT_decl_line
	.long	369                             ## DW_AT_type
	.byte	14                              ## Abbrev [14] 0x125:0xf DW_TAG_variable
	.byte	3                               ## DW_AT_location
	.byte	145
	.ascii	"\340~"
	.long	402                             ## DW_AT_name
	.byte	2                               ## DW_AT_decl_file
	.byte	18                              ## DW_AT_decl_line
	.long	60                              ## DW_AT_type
	.byte	14                              ## Abbrev [14] 0x134:0xf DW_TAG_variable
	.byte	3                               ## DW_AT_location
	.byte	145
	.ascii	"\360~"
	.long	405                             ## DW_AT_name
	.byte	2                               ## DW_AT_decl_file
	.byte	18                              ## DW_AT_decl_line
	.long	60                              ## DW_AT_type
	.byte	14                              ## Abbrev [14] 0x143:0xf DW_TAG_variable
	.byte	3                               ## DW_AT_location
	.byte	145
	.ascii	"\360}"
	.long	408                             ## DW_AT_name
	.byte	2                               ## DW_AT_decl_file
	.byte	18                              ## DW_AT_decl_line
	.long	60                              ## DW_AT_type
	.byte	14                              ## Abbrev [14] 0x152:0xf DW_TAG_variable
	.byte	3                               ## DW_AT_location
	.byte	145
	.ascii	"\320}"
	.long	410                             ## DW_AT_name
	.byte	2                               ## DW_AT_decl_file
	.byte	18                              ## DW_AT_decl_line
	.long	60                              ## DW_AT_type
	.byte	14                              ## Abbrev [14] 0x161:0xf DW_TAG_variable
	.byte	3                               ## DW_AT_location
	.byte	145
	.ascii	"\340}"
	.long	413                             ## DW_AT_name
	.byte	2                               ## DW_AT_decl_file
	.byte	18                              ## DW_AT_decl_line
	.long	60                              ## DW_AT_type
	.byte	0                               ## End Of Children Mark
	.byte	7                               ## Abbrev [7] 0x171:0x7 DW_TAG_base_type
	.long	371                             ## DW_AT_name
	.byte	5                               ## DW_AT_encoding
	.byte	4                               ## DW_AT_byte_size
	.byte	2                               ## Abbrev [2] 0x178:0x5 DW_TAG_pointer_type
	.long	381                             ## DW_AT_type
	.byte	2                               ## Abbrev [2] 0x17d:0x5 DW_TAG_pointer_type
	.long	386                             ## DW_AT_type
	.byte	7                               ## Abbrev [7] 0x182:0x7 DW_TAG_base_type
	.long	385                             ## DW_AT_name
	.byte	6                               ## DW_AT_encoding
	.byte	1                               ## DW_AT_byte_size
	.byte	15                              ## Abbrev [15] 0x189:0xc DW_TAG_array_type
	.long	83                              ## DW_AT_type
	.byte	6                               ## Abbrev [6] 0x18e:0x6 DW_TAG_subrange_type
	.long	90                              ## DW_AT_type
	.byte	4                               ## DW_AT_count
	.byte	0                               ## End Of Children Mark
	.byte	3                               ## Abbrev [3] 0x195:0x5 DW_TAG_const_type
	.long	369                             ## DW_AT_type
	.byte	0                               ## End Of Children Mark
Ldebug_info_end0:
	.section	__DWARF,__debug_str,regular,debug
Linfo_string:
	.asciz	"clang version 14.0.0 (https://github.com/llvm/llvm-project.git e7298464c5d004a119583cdb8a120dc3d968508d)" ## string offset=0
	.asciz	"matrix.c"                      ## string offset=105
	.asciz	"/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX12.1.sdk" ## string offset=114
	.asciz	"MacOSX12.1.sdk"                ## string offset=213
	.asciz	"/Users/haohua/Documents/GitHub/cs-nano-projects/cpp-simd/simple-matrix" ## string offset=228
	.asciz	"__m128d"                       ## string offset=299
	.asciz	"double"                        ## string offset=307
	.asciz	"__ARRAY_SIZE_TYPE__"           ## string offset=314
	.asciz	"__mm_load1_pd_struct"          ## string offset=334
	.asciz	"__u"                           ## string offset=355
	.asciz	"__v2df"                        ## string offset=359
	.asciz	"main"                          ## string offset=366
	.asciz	"int"                           ## string offset=371
	.asciz	"argc"                          ## string offset=375
	.asciz	"argv"                          ## string offset=380
	.asciz	"char"                          ## string offset=385
	.asciz	"A"                             ## string offset=390
	.asciz	"B"                             ## string offset=392
	.asciz	"C"                             ## string offset=394
	.asciz	"N"                             ## string offset=396
	.asciz	"M"                             ## string offset=398
	.asciz	"i"                             ## string offset=400
	.asciz	"c1"                            ## string offset=402
	.asciz	"c2"                            ## string offset=405
	.asciz	"a"                             ## string offset=408
	.asciz	"b1"                            ## string offset=410
	.asciz	"b2"                            ## string offset=413
	.section	__DWARF,__apple_names,regular,debug
Lnames_begin:
	.long	1212240712                      ## Header Magic
	.short	1                               ## Header Version
	.short	0                               ## Header Hash Function
	.long	1                               ## Header Bucket Count
	.long	1                               ## Header Hash Count
	.long	12                              ## Header Data Length
	.long	0                               ## HeaderData Die Offset Base
	.long	1                               ## HeaderData Atom Count
	.short	1                               ## DW_ATOM_die_offset
	.short	6                               ## DW_FORM_data4
	.long	0                               ## Bucket 0
	.long	2090499946                      ## Hash in Bucket 0
.set Lset5, LNames0-Lnames_begin        ## Offset in Bucket 0
	.long	Lset5
LNames0:
	.long	366                             ## main
	.long	1                               ## Num DIEs
	.long	146
	.long	0
	.section	__DWARF,__apple_objc,regular,debug
Lobjc_begin:
	.long	1212240712                      ## Header Magic
	.short	1                               ## Header Version
	.short	0                               ## Header Hash Function
	.long	1                               ## Header Bucket Count
	.long	0                               ## Header Hash Count
	.long	12                              ## Header Data Length
	.long	0                               ## HeaderData Die Offset Base
	.long	1                               ## HeaderData Atom Count
	.short	1                               ## DW_ATOM_die_offset
	.short	6                               ## DW_FORM_data4
	.long	-1                              ## Bucket 0
	.section	__DWARF,__apple_namespac,regular,debug
Lnamespac_begin:
	.long	1212240712                      ## Header Magic
	.short	1                               ## Header Version
	.short	0                               ## Header Hash Function
	.long	1                               ## Header Bucket Count
	.long	0                               ## Header Hash Count
	.long	12                              ## Header Data Length
	.long	0                               ## HeaderData Die Offset Base
	.long	1                               ## HeaderData Atom Count
	.short	1                               ## DW_ATOM_die_offset
	.short	6                               ## DW_FORM_data4
	.long	-1                              ## Bucket 0
	.section	__DWARF,__apple_types,regular,debug
Ltypes_begin:
	.long	1212240712                      ## Header Magic
	.short	1                               ## Header Version
	.short	0                               ## Header Hash Function
	.long	7                               ## Header Bucket Count
	.long	7                               ## Header Hash Count
	.long	20                              ## Header Data Length
	.long	0                               ## HeaderData Die Offset Base
	.long	3                               ## HeaderData Atom Count
	.short	1                               ## DW_ATOM_die_offset
	.short	6                               ## DW_FORM_data4
	.short	3                               ## DW_ATOM_die_tag
	.short	5                               ## DW_FORM_data2
	.short	4                               ## DW_ATOM_type_flags
	.short	11                              ## DW_FORM_data1
	.long	-1                              ## Bucket 0
	.long	0                               ## Bucket 1
	.long	-1                              ## Bucket 2
	.long	1                               ## Bucket 3
	.long	2                               ## Bucket 4
	.long	3                               ## Bucket 5
	.long	6                               ## Bucket 6
	.long	-594775205                      ## Hash in Bucket 1
	.long	193495088                       ## Hash in Bucket 3
	.long	-113419488                      ## Hash in Bucket 4
	.long	683761188                       ## Hash in Bucket 5
	.long	2090147939                      ## Hash in Bucket 5
	.long	-328087787                      ## Hash in Bucket 5
	.long	2047239823                      ## Hash in Bucket 6
.set Lset6, Ltypes1-Ltypes_begin        ## Offset in Bucket 1
	.long	Lset6
.set Lset7, Ltypes4-Ltypes_begin        ## Offset in Bucket 3
	.long	Lset7
.set Lset8, Ltypes3-Ltypes_begin        ## Offset in Bucket 4
	.long	Lset8
.set Lset9, Ltypes6-Ltypes_begin        ## Offset in Bucket 5
	.long	Lset9
.set Lset10, Ltypes5-Ltypes_begin       ## Offset in Bucket 5
	.long	Lset10
.set Lset11, Ltypes0-Ltypes_begin       ## Offset in Bucket 5
	.long	Lset11
.set Lset12, Ltypes2-Ltypes_begin       ## Offset in Bucket 6
	.long	Lset12
Ltypes1:
	.long	314                             ## __ARRAY_SIZE_TYPE__
	.long	1                               ## Num DIEs
	.long	90
	.short	36
	.byte	0
	.long	0
Ltypes4:
	.long	371                             ## int
	.long	1                               ## Num DIEs
	.long	369
	.short	36
	.byte	0
	.long	0
Ltypes3:
	.long	307                             ## double
	.long	1                               ## Num DIEs
	.long	83
	.short	36
	.byte	0
	.long	0
Ltypes6:
	.long	334                             ## __mm_load1_pd_struct
	.long	1                               ## Num DIEs
	.long	107
	.short	19
	.byte	0
	.long	0
Ltypes5:
	.long	385                             ## char
	.long	1                               ## Num DIEs
	.long	386
	.short	36
	.byte	0
	.long	0
Ltypes0:
	.long	359                             ## __v2df
	.long	1                               ## Num DIEs
	.long	130
	.short	22
	.byte	0
	.long	0
Ltypes2:
	.long	299                             ## __m128d
	.long	1                               ## Num DIEs
	.long	60
	.short	22
	.byte	0
	.long	0
.subsections_via_symbols
	.section	__DWARF,__debug_line,regular,debug
Lsection_line:
Lline_table_start0:
