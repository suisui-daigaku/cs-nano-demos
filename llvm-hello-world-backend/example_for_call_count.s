	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 12, 0	sdk_version 12, 1
	.globl	_foo                            ## -- Begin function foo
	.p2align	4, 0x90
_foo:                                   ## @foo
Lfunc_begin0:
	.file	1 "/Users/haohua/Documents/GitHub/cs-nano-projects/llvm-hello-world-backend" "example_for_call_count.c"
	.loc	1 12 0                          ## example_for_call_count.c:12:0
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
Ltmp0:
	.loc	1 12 14 prologue_end            ## example_for_call_count.c:12:14
	popq	%rbp
	retq
Ltmp1:
Lfunc_end0:
	.cfi_endproc
                                        ## -- End function
	.globl	_bar                            ## -- Begin function bar
	.p2align	4, 0x90
_bar:                                   ## @bar
Lfunc_begin1:
	.loc	1 13 0                          ## example_for_call_count.c:13:0
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
Ltmp2:
	.loc	1 13 13 prologue_end            ## example_for_call_count.c:13:13
	callq	_foo
	.loc	1 13 20 is_stmt 0               ## example_for_call_count.c:13:20
	popq	%rbp
	retq
Ltmp3:
Lfunc_end1:
	.cfi_endproc
                                        ## -- End function
	.globl	_fez                            ## -- Begin function fez
	.p2align	4, 0x90
_fez:                                   ## @fez
Lfunc_begin2:
	.loc	1 14 0 is_stmt 1                ## example_for_call_count.c:14:0
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
Ltmp4:
	.loc	1 14 13 prologue_end            ## example_for_call_count.c:14:13
	callq	_bar
	.loc	1 14 20 is_stmt 0               ## example_for_call_count.c:14:20
	popq	%rbp
	retq
Ltmp5:
Lfunc_end2:
	.cfi_endproc
                                        ## -- End function
	.globl	_main                           ## -- Begin function main
	.p2align	4, 0x90
_main:                                  ## @main
Lfunc_begin3:
	.loc	1 16 0 is_stmt 1                ## example_for_call_count.c:16:0
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movl	$0, -8(%rbp)
Ltmp6:
	.loc	1 17 3 prologue_end             ## example_for_call_count.c:17:3
	callq	_foo
	.loc	1 18 3                          ## example_for_call_count.c:18:3
	callq	_bar
	.loc	1 19 3                          ## example_for_call_count.c:19:3
	callq	_fez
	.loc	1 21 7                          ## example_for_call_count.c:21:7
	movl	$0, -4(%rbp)
Ltmp7:
	.loc	1 22 11                         ## example_for_call_count.c:22:11
	movl	$0, -4(%rbp)
LBB3_1:                                 ## =>This Inner Loop Header: Depth=1
Ltmp8:
	.loc	1 22 19 is_stmt 0               ## example_for_call_count.c:22:19
	cmpl	$10, -4(%rbp)
Ltmp9:
	.loc	1 22 3                          ## example_for_call_count.c:22:3
	jge	LBB3_4
## %bb.2:                               ##   in Loop: Header=BB3_1 Depth=1
Ltmp10:
	.loc	1 23 5 is_stmt 1                ## example_for_call_count.c:23:5
	callq	_foo
## %bb.3:                               ##   in Loop: Header=BB3_1 Depth=1
	.loc	1 22 27                         ## example_for_call_count.c:22:27
	movl	-4(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -4(%rbp)
	.loc	1 22 3 is_stmt 0                ## example_for_call_count.c:22:3
	jmp	LBB3_1
Ltmp11:
LBB3_4:
	.loc	1 25 3 is_stmt 1                ## example_for_call_count.c:25:3
	xorl	%eax, %eax
	addq	$16, %rsp
	popq	%rbp
	retq
Ltmp12:
Lfunc_end3:
	.cfi_endproc
                                        ## -- End function
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
	.byte	46                              ## DW_TAG_subprogram
	.byte	0                               ## DW_CHILDREN_no
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
	.byte	63                              ## DW_AT_external
	.byte	25                              ## DW_FORM_flag_present
	.byte	0                               ## EOM(1)
	.byte	0                               ## EOM(2)
	.byte	3                               ## Abbreviation Code
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
	.byte	73                              ## DW_AT_type
	.byte	19                              ## DW_FORM_ref4
	.byte	63                              ## DW_AT_external
	.byte	25                              ## DW_FORM_flag_present
	.byte	0                               ## EOM(1)
	.byte	0                               ## EOM(2)
	.byte	4                               ## Abbreviation Code
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
	.byte	5                               ## Abbreviation Code
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
	.byte	1                               ## Abbrev [1] 0xb:0x96 DW_TAG_compile_unit
	.long	0                               ## DW_AT_producer
	.short	12                              ## DW_AT_language
	.long	105                             ## DW_AT_name
	.long	130                             ## DW_AT_LLVM_sysroot
	.long	229                             ## DW_AT_APPLE_sdk
.set Lset2, Lline_table_start0-Lsection_line ## DW_AT_stmt_list
	.long	Lset2
	.long	244                             ## DW_AT_comp_dir
	.quad	Lfunc_begin0                    ## DW_AT_low_pc
.set Lset3, Lfunc_end3-Lfunc_begin0     ## DW_AT_high_pc
	.long	Lset3
	.byte	2                               ## Abbrev [2] 0x32:0x15 DW_TAG_subprogram
	.quad	Lfunc_begin0                    ## DW_AT_low_pc
.set Lset4, Lfunc_end0-Lfunc_begin0     ## DW_AT_high_pc
	.long	Lset4
	.byte	1                               ## DW_AT_frame_base
	.byte	86
	.long	317                             ## DW_AT_name
	.byte	1                               ## DW_AT_decl_file
	.byte	12                              ## DW_AT_decl_line
                                        ## DW_AT_external
	.byte	2                               ## Abbrev [2] 0x47:0x15 DW_TAG_subprogram
	.quad	Lfunc_begin1                    ## DW_AT_low_pc
.set Lset5, Lfunc_end1-Lfunc_begin1     ## DW_AT_high_pc
	.long	Lset5
	.byte	1                               ## DW_AT_frame_base
	.byte	86
	.long	321                             ## DW_AT_name
	.byte	1                               ## DW_AT_decl_file
	.byte	13                              ## DW_AT_decl_line
                                        ## DW_AT_external
	.byte	2                               ## Abbrev [2] 0x5c:0x15 DW_TAG_subprogram
	.quad	Lfunc_begin2                    ## DW_AT_low_pc
.set Lset6, Lfunc_end2-Lfunc_begin2     ## DW_AT_high_pc
	.long	Lset6
	.byte	1                               ## DW_AT_frame_base
	.byte	86
	.long	325                             ## DW_AT_name
	.byte	1                               ## DW_AT_decl_file
	.byte	14                              ## DW_AT_decl_line
                                        ## DW_AT_external
	.byte	3                               ## Abbrev [3] 0x71:0x28 DW_TAG_subprogram
	.quad	Lfunc_begin3                    ## DW_AT_low_pc
.set Lset7, Lfunc_end3-Lfunc_begin3     ## DW_AT_high_pc
	.long	Lset7
	.byte	1                               ## DW_AT_frame_base
	.byte	86
	.long	329                             ## DW_AT_name
	.byte	1                               ## DW_AT_decl_file
	.byte	16                              ## DW_AT_decl_line
	.long	153                             ## DW_AT_type
                                        ## DW_AT_external
	.byte	4                               ## Abbrev [4] 0x8a:0xe DW_TAG_variable
	.byte	2                               ## DW_AT_location
	.byte	145
	.byte	124
	.long	338                             ## DW_AT_name
	.byte	1                               ## DW_AT_decl_file
	.byte	21                              ## DW_AT_decl_line
	.long	153                             ## DW_AT_type
	.byte	0                               ## End Of Children Mark
	.byte	5                               ## Abbrev [5] 0x99:0x7 DW_TAG_base_type
	.long	334                             ## DW_AT_name
	.byte	5                               ## DW_AT_encoding
	.byte	4                               ## DW_AT_byte_size
	.byte	0                               ## End Of Children Mark
Ldebug_info_end0:
	.section	__DWARF,__debug_str,regular,debug
Linfo_string:
	.asciz	"clang version 14.0.0 (https://github.com/llvm/llvm-project.git e7298464c5d004a119583cdb8a120dc3d968508d)" ## string offset=0
	.asciz	"example_for_call_count.c"      ## string offset=105
	.asciz	"/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX12.1.sdk" ## string offset=130
	.asciz	"MacOSX12.1.sdk"                ## string offset=229
	.asciz	"/Users/haohua/Documents/GitHub/cs-nano-projects/llvm-hello-world-backend" ## string offset=244
	.asciz	"foo"                           ## string offset=317
	.asciz	"bar"                           ## string offset=321
	.asciz	"fez"                           ## string offset=325
	.asciz	"main"                          ## string offset=329
	.asciz	"int"                           ## string offset=334
	.asciz	"ii"                            ## string offset=338
	.section	__DWARF,__apple_names,regular,debug
Lnames_begin:
	.long	1212240712                      ## Header Magic
	.short	1                               ## Header Version
	.short	0                               ## Header Hash Function
	.long	4                               ## Header Bucket Count
	.long	4                               ## Header Hash Count
	.long	12                              ## Header Data Length
	.long	0                               ## HeaderData Die Offset Base
	.long	1                               ## HeaderData Atom Count
	.short	1                               ## DW_ATOM_die_offset
	.short	6                               ## DW_FORM_data4
	.long	-1                              ## Bucket 0
	.long	0                               ## Bucket 1
	.long	1                               ## Bucket 2
	.long	-1                              ## Bucket 3
	.long	193491849                       ## Hash in Bucket 1
	.long	193487034                       ## Hash in Bucket 2
	.long	193491530                       ## Hash in Bucket 2
	.long	2090499946                      ## Hash in Bucket 2
.set Lset8, LNames0-Lnames_begin        ## Offset in Bucket 1
	.long	Lset8
.set Lset9, LNames1-Lnames_begin        ## Offset in Bucket 2
	.long	Lset9
.set Lset10, LNames2-Lnames_begin       ## Offset in Bucket 2
	.long	Lset10
.set Lset11, LNames3-Lnames_begin       ## Offset in Bucket 2
	.long	Lset11
LNames0:
	.long	317                             ## foo
	.long	1                               ## Num DIEs
	.long	50
	.long	0
LNames1:
	.long	321                             ## bar
	.long	1                               ## Num DIEs
	.long	71
	.long	0
LNames2:
	.long	325                             ## fez
	.long	1                               ## Num DIEs
	.long	92
	.long	0
LNames3:
	.long	329                             ## main
	.long	1                               ## Num DIEs
	.long	113
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
	.long	1                               ## Header Bucket Count
	.long	1                               ## Header Hash Count
	.long	20                              ## Header Data Length
	.long	0                               ## HeaderData Die Offset Base
	.long	3                               ## HeaderData Atom Count
	.short	1                               ## DW_ATOM_die_offset
	.short	6                               ## DW_FORM_data4
	.short	3                               ## DW_ATOM_die_tag
	.short	5                               ## DW_FORM_data2
	.short	4                               ## DW_ATOM_type_flags
	.short	11                              ## DW_FORM_data1
	.long	0                               ## Bucket 0
	.long	193495088                       ## Hash in Bucket 0
.set Lset12, Ltypes0-Ltypes_begin       ## Offset in Bucket 0
	.long	Lset12
Ltypes0:
	.long	334                             ## int
	.long	1                               ## Num DIEs
	.long	153
	.short	36
	.byte	0
	.long	0
.subsections_via_symbols
	.section	__DWARF,__debug_line,regular,debug
Lsection_line:
Lline_table_start0:
