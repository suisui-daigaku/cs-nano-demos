--- |
  ; ModuleID = 'hello-matrix.ll'
  source_filename = "hello-matrix.c"
  target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
  target triple = "x86_64-apple-macosx12.0.0"
  
  %struct.__mm_load1_pd_struct = type { double }
  
  @.str = private unnamed_addr constant [15 x i8] c"%g, %g\0A%g, %g\0A\00", align 1
  @__stack_chk_guard = external global i8*
  
  ; Function Attrs: noinline nounwind optnone ssp uwtable
  define i32 @main(i32 noundef %0, i8** noundef %1) #0 {
    %StackGuardSlot = alloca i8*, align 8
    %3 = call i8* @llvm.stackguard()
    call void @llvm.stackprotector(i8* %3, i8** %StackGuardSlot)
    %4 = alloca double*, align 8
    %5 = alloca <2 x double>, align 16
    %6 = alloca double*, align 8
    %7 = alloca <2 x double>, align 16
    %8 = alloca <2 x double>, align 16
    %9 = alloca <2 x double>, align 16
    %10 = alloca <2 x double>, align 16
    %11 = alloca <2 x double>, align 16
    %12 = alloca <2 x double>, align 16
    %13 = alloca <2 x double>, align 16
    %14 = alloca <2 x double>, align 16
    %15 = alloca <2 x double>, align 16
    %16 = alloca double*, align 8
    %17 = alloca double, align 8
    %18 = alloca <2 x double>, align 16
    %19 = alloca double*, align 8
    %20 = alloca double, align 8
    %21 = alloca <2 x double>, align 16
    %22 = alloca double*, align 8
    %23 = alloca double*, align 8
    %24 = alloca double*, align 8
    %25 = alloca i32, align 4
    %26 = alloca i32, align 4
    %27 = alloca i8**, align 8
    %28 = alloca [4 x double], align 16
    %29 = alloca [4 x double], align 16
    %30 = alloca [4 x double], align 16
    %31 = alloca i32, align 4
    %32 = alloca i32, align 4
    %33 = alloca i32, align 4
    %34 = alloca <2 x double>, align 16
    %35 = alloca <2 x double>, align 16
    %36 = alloca <2 x double>, align 16
    %37 = alloca <2 x double>, align 16
    %38 = alloca <2 x double>, align 16
    store i32 0, i32* %25, align 4
    store i32 %0, i32* %26, align 4
    store i8** %1, i8*** %27, align 8
    store i32 2, i32* %31, align 4
    store i32 2, i32* %32, align 4
    store i32 0, i32* %33, align 4
    %39 = getelementptr inbounds [4 x double], [4 x double]* %28, i64 0, i64 0
    store double 1.000000e+00, double* %39, align 16
    %40 = getelementptr inbounds [4 x double], [4 x double]* %28, i64 0, i64 1
    store double 0.000000e+00, double* %40, align 8
    %41 = getelementptr inbounds [4 x double], [4 x double]* %28, i64 0, i64 2
    store double 0.000000e+00, double* %41, align 16
    %42 = getelementptr inbounds [4 x double], [4 x double]* %28, i64 0, i64 3
    store double 1.000000e+00, double* %42, align 8
    %43 = getelementptr inbounds [4 x double], [4 x double]* %29, i64 0, i64 0
    store double 1.000000e+00, double* %43, align 16
    %44 = getelementptr inbounds [4 x double], [4 x double]* %29, i64 0, i64 1
    store double 2.000000e+00, double* %44, align 8
    %45 = getelementptr inbounds [4 x double], [4 x double]* %29, i64 0, i64 2
    store double 3.000000e+00, double* %45, align 16
    %46 = getelementptr inbounds [4 x double], [4 x double]* %29, i64 0, i64 3
    store double 4.000000e+00, double* %46, align 8
    %47 = getelementptr inbounds [4 x double], [4 x double]* %30, i64 0, i64 0
    store double 0.000000e+00, double* %47, align 16
    %48 = getelementptr inbounds [4 x double], [4 x double]* %30, i64 0, i64 1
    store double 0.000000e+00, double* %48, align 8
    %49 = getelementptr inbounds [4 x double], [4 x double]* %30, i64 0, i64 2
    store double 0.000000e+00, double* %49, align 16
    %50 = getelementptr inbounds [4 x double], [4 x double]* %30, i64 0, i64 3
    store double 0.000000e+00, double* %50, align 8
    %51 = getelementptr inbounds [4 x double], [4 x double]* %30, i64 0, i64 0
    %52 = getelementptr inbounds double, double* %51, i64 0
    store double* %52, double** %22, align 8
    %53 = load double*, double** %22, align 8
    %54 = bitcast double* %53 to <2 x double>*
    %55 = load <2 x double>, <2 x double>* %54, align 16
    store <2 x double> %55, <2 x double>* %34, align 16
    %56 = getelementptr inbounds [4 x double], [4 x double]* %30, i64 0, i64 0
    %57 = getelementptr inbounds double, double* %56, i64 2
    store double* %57, double** %23, align 8
    %58 = load double*, double** %23, align 8
    %59 = bitcast double* %58 to <2 x double>*
    %60 = load <2 x double>, <2 x double>* %59, align 16
    store <2 x double> %60, <2 x double>* %35, align 16
    store i32 0, i32* %33, align 4
    br label %61
  
  61:                                               ; preds = %119, %2
    %62 = load i32, i32* %33, align 4
    %63 = icmp slt i32 %62, 2
    br i1 %63, label %64, label %122
  
  64:                                               ; preds = %61
    %65 = getelementptr inbounds [4 x double], [4 x double]* %28, i64 0, i64 0
    %66 = load i32, i32* %33, align 4
    %67 = mul nsw i32 %66, 2
    %68 = sext i32 %67 to i64
    %69 = getelementptr inbounds double, double* %65, i64 %68
    store double* %69, double** %24, align 8
    %70 = load double*, double** %24, align 8
    %71 = bitcast double* %70 to <2 x double>*
    %72 = load <2 x double>, <2 x double>* %71, align 16
    store <2 x double> %72, <2 x double>* %36, align 16
    %73 = getelementptr inbounds [4 x double], [4 x double]* %29, i64 0, i64 0
    %74 = load i32, i32* %33, align 4
    %75 = sext i32 %74 to i64
    %76 = getelementptr inbounds double, double* %73, i64 %75
    %77 = getelementptr inbounds double, double* %76, i64 0
    store double* %77, double** %16, align 8
    %78 = load double*, double** %16, align 8
    %79 = bitcast double* %78 to %struct.__mm_load1_pd_struct*
    %80 = getelementptr inbounds %struct.__mm_load1_pd_struct, %struct.__mm_load1_pd_struct* %79, i32 0, i32 0
    %81 = load double, double* %80, align 1
    store double %81, double* %17, align 8
    %82 = load double, double* %17, align 8
    %83 = insertelement <2 x double> undef, double %82, i32 0
    %84 = load double, double* %17, align 8
    %85 = insertelement <2 x double> %83, double %84, i32 1
    store <2 x double> %85, <2 x double>* %18, align 16
    %86 = load <2 x double>, <2 x double>* %18, align 16
    store <2 x double> %86, <2 x double>* %37, align 16
    %87 = getelementptr inbounds [4 x double], [4 x double]* %29, i64 0, i64 0
    %88 = load i32, i32* %33, align 4
    %89 = sext i32 %88 to i64
    %90 = getelementptr inbounds double, double* %87, i64 %89
    %91 = getelementptr inbounds double, double* %90, i64 2
    store double* %91, double** %19, align 8
    %92 = load double*, double** %19, align 8
    %93 = bitcast double* %92 to %struct.__mm_load1_pd_struct*
    %94 = getelementptr inbounds %struct.__mm_load1_pd_struct, %struct.__mm_load1_pd_struct* %93, i32 0, i32 0
    %95 = load double, double* %94, align 1
    store double %95, double* %20, align 8
    %96 = load double, double* %20, align 8
    %97 = insertelement <2 x double> undef, double %96, i32 0
    %98 = load double, double* %20, align 8
    %99 = insertelement <2 x double> %97, double %98, i32 1
    store <2 x double> %99, <2 x double>* %21, align 16
    %100 = load <2 x double>, <2 x double>* %21, align 16
    store <2 x double> %100, <2 x double>* %38, align 16
    %101 = load <2 x double>, <2 x double>* %34, align 16
    %102 = load <2 x double>, <2 x double>* %36, align 16
    %103 = load <2 x double>, <2 x double>* %37, align 16
    store <2 x double> %102, <2 x double>* %8, align 16
    store <2 x double> %103, <2 x double>* %9, align 16
    %104 = load <2 x double>, <2 x double>* %8, align 16
    %105 = load <2 x double>, <2 x double>* %9, align 16
    %106 = fmul <2 x double> %104, %105
    store <2 x double> %101, <2 x double>* %12, align 16
    store <2 x double> %106, <2 x double>* %13, align 16
    %107 = load <2 x double>, <2 x double>* %12, align 16
    %108 = load <2 x double>, <2 x double>* %13, align 16
    %109 = fadd <2 x double> %107, %108
    store <2 x double> %109, <2 x double>* %34, align 16
    %110 = load <2 x double>, <2 x double>* %35, align 16
    %111 = load <2 x double>, <2 x double>* %36, align 16
    %112 = load <2 x double>, <2 x double>* %38, align 16
    store <2 x double> %111, <2 x double>* %10, align 16
    store <2 x double> %112, <2 x double>* %11, align 16
    %113 = load <2 x double>, <2 x double>* %10, align 16
    %114 = load <2 x double>, <2 x double>* %11, align 16
    %115 = fmul <2 x double> %113, %114
    store <2 x double> %110, <2 x double>* %14, align 16
    store <2 x double> %115, <2 x double>* %15, align 16
    %116 = load <2 x double>, <2 x double>* %14, align 16
    %117 = load <2 x double>, <2 x double>* %15, align 16
    %118 = fadd <2 x double> %116, %117
    store <2 x double> %118, <2 x double>* %35, align 16
    br label %119
  
  119:                                              ; preds = %64
    %120 = load i32, i32* %33, align 4
    %121 = add nsw i32 %120, 1
    store i32 %121, i32* %33, align 4
    br label %61, !llvm.loop !6
  
  122:                                              ; preds = %61
    %123 = getelementptr inbounds [4 x double], [4 x double]* %30, i64 0, i64 0
    %124 = getelementptr inbounds double, double* %123, i64 0
    %125 = load <2 x double>, <2 x double>* %34, align 16
    store double* %124, double** %4, align 8
    store <2 x double> %125, <2 x double>* %5, align 16
    %126 = load <2 x double>, <2 x double>* %5, align 16
    %127 = load double*, double** %4, align 8
    %128 = bitcast double* %127 to <2 x double>*
    store <2 x double> %126, <2 x double>* %128, align 16
    %129 = getelementptr inbounds [4 x double], [4 x double]* %30, i64 0, i64 0
    %130 = getelementptr inbounds double, double* %129, i64 2
    %131 = load <2 x double>, <2 x double>* %35, align 16
    store double* %130, double** %6, align 8
    store <2 x double> %131, <2 x double>* %7, align 16
    %132 = load <2 x double>, <2 x double>* %7, align 16
    %133 = load double*, double** %6, align 8
    %134 = bitcast double* %133 to <2 x double>*
    store <2 x double> %132, <2 x double>* %134, align 16
    %135 = getelementptr inbounds [4 x double], [4 x double]* %30, i64 0, i64 0
    %136 = load double, double* %135, align 16
    %137 = getelementptr inbounds [4 x double], [4 x double]* %30, i64 0, i64 2
    %138 = load double, double* %137, align 16
    %139 = getelementptr inbounds [4 x double], [4 x double]* %30, i64 0, i64 1
    %140 = load double, double* %139, align 8
    %141 = getelementptr inbounds [4 x double], [4 x double]* %30, i64 0, i64 3
    %142 = load double, double* %141, align 8
    %143 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str, i64 0, i64 0), double noundef %136, double noundef %138, double noundef %140, double noundef %142)
    ret i32 0
  }
  
  declare i32 @printf(i8* noundef, ...) #1
  
  ; Function Attrs: nofree nosync nounwind willreturn
  declare i8* @llvm.stackguard() #2
  
  ; Function Attrs: nofree nosync nounwind willreturn
  declare void @llvm.stackprotector(i8*, i8**) #2
  
  attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="128" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
  attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
  attributes #2 = { nofree nosync nounwind willreturn }
  
  !llvm.module.flags = !{!0, !1, !2, !3, !4}
  !llvm.ident = !{!5}
  
  !0 = !{i32 2, !"SDK Version", [2 x i32] [i32 12, i32 1]}
  !1 = !{i32 1, !"wchar_size", i32 4}
  !2 = !{i32 7, !"PIC Level", i32 2}
  !3 = !{i32 7, !"uwtable", i32 1}
  !4 = !{i32 7, !"frame-pointer", i32 2}
  !5 = !{!"clang version 14.0.0 (https://github.com/llvm/llvm-project.git e7298464c5d004a119583cdb8a120dc3d968508d)"}
  !6 = distinct !{!6, !7}
  !7 = !{!"llvm.loop.mustprogress"}

...
---
name:            main
alignment:       16
exposesReturnsTwice: false
legalized:       false
regBankSelected: false
selected:        false
failedISel:      false
tracksRegLiveness: true
hasWinCFI:       false
failsVerification: false
tracksDebugUserValues: false
registers:
  - { id: 0, class: gr32, preferred-register: '' }
  - { id: 1, class: gr32, preferred-register: '' }
  - { id: 2, class: gr64, preferred-register: '' }
  - { id: 3, class: gr64, preferred-register: '' }
  - { id: 4, class: vr128, preferred-register: '' }
  - { id: 5, class: gr64, preferred-register: '' }
  - { id: 6, class: vr128, preferred-register: '' }
  - { id: 7, class: gr64, preferred-register: '' }
  - { id: 8, class: gr64, preferred-register: '' }
  - { id: 9, class: gr64, preferred-register: '' }
  - { id: 10, class: gr64, preferred-register: '' }
  - { id: 11, class: gr64, preferred-register: '' }
  - { id: 12, class: vr128, preferred-register: '' }
  - { id: 13, class: gr64, preferred-register: '' }
  - { id: 14, class: vr128, preferred-register: '' }
  - { id: 15, class: gr64, preferred-register: '' }
  - { id: 16, class: gr64, preferred-register: '' }
  - { id: 17, class: gr64, preferred-register: '' }
  - { id: 18, class: gr64, preferred-register: '' }
  - { id: 19, class: fr64, preferred-register: '' }
  - { id: 20, class: fr64, preferred-register: '' }
  - { id: 21, class: fr64, preferred-register: '' }
  - { id: 22, class: fr64, preferred-register: '' }
  - { id: 23, class: fr64, preferred-register: '' }
  - { id: 24, class: fr64, preferred-register: '' }
  - { id: 25, class: fr64, preferred-register: '' }
  - { id: 26, class: fr64, preferred-register: '' }
  - { id: 27, class: fr64, preferred-register: '' }
  - { id: 28, class: fr64, preferred-register: '' }
  - { id: 29, class: fr64, preferred-register: '' }
  - { id: 30, class: fr64, preferred-register: '' }
  - { id: 31, class: gr64, preferred-register: '' }
  - { id: 32, class: gr32, preferred-register: '' }
  - { id: 33, class: gr32, preferred-register: '' }
  - { id: 34, class: gr64, preferred-register: '' }
  - { id: 35, class: fr64, preferred-register: '' }
  - { id: 36, class: fr64, preferred-register: '' }
  - { id: 37, class: fr64, preferred-register: '' }
  - { id: 38, class: fr64, preferred-register: '' }
  - { id: 39, class: gr32, preferred-register: '' }
  - { id: 40, class: fr64, preferred-register: '' }
  - { id: 41, class: fr64, preferred-register: '' }
  - { id: 42, class: fr64, preferred-register: '' }
  - { id: 43, class: fr64, preferred-register: '' }
  - { id: 44, class: gr64, preferred-register: '' }
  - { id: 45, class: vr128, preferred-register: '' }
  - { id: 46, class: gr64, preferred-register: '' }
  - { id: 47, class: vr128, preferred-register: '' }
  - { id: 48, class: vr128, preferred-register: '' }
  - { id: 49, class: gr64, preferred-register: '' }
  - { id: 50, class: vr128, preferred-register: '' }
  - { id: 51, class: gr64, preferred-register: '' }
  - { id: 52, class: gr64, preferred-register: '' }
  - { id: 53, class: gr64, preferred-register: '' }
  - { id: 54, class: gr64, preferred-register: '' }
  - { id: 55, class: vr128, preferred-register: '' }
  - { id: 56, class: gr64, preferred-register: '' }
  - { id: 57, class: vr128, preferred-register: '' }
  - { id: 58, class: vr128, preferred-register: '' }
  - { id: 59, class: gr64, preferred-register: '' }
  - { id: 60, class: vr128, preferred-register: '' }
  - { id: 61, class: gr64, preferred-register: '' }
  - { id: 62, class: gr64, preferred-register: '' }
  - { id: 63, class: gr64, preferred-register: '' }
  - { id: 64, class: gr64, preferred-register: '' }
  - { id: 65, class: gr64, preferred-register: '' }
  - { id: 66, class: vr128, preferred-register: '' }
  - { id: 67, class: vr128, preferred-register: '' }
  - { id: 68, class: vr128, preferred-register: '' }
  - { id: 69, class: vr128, preferred-register: '' }
  - { id: 70, class: vr128, preferred-register: '' }
  - { id: 71, class: vr128, preferred-register: '' }
  - { id: 72, class: vr128, preferred-register: '' }
  - { id: 73, class: vr128, preferred-register: '' }
  - { id: 74, class: vr128, preferred-register: '' }
  - { id: 75, class: vr128, preferred-register: '' }
  - { id: 76, class: vr128, preferred-register: '' }
  - { id: 77, class: vr128, preferred-register: '' }
  - { id: 78, class: vr128, preferred-register: '' }
  - { id: 79, class: vr128, preferred-register: '' }
  - { id: 80, class: vr128, preferred-register: '' }
  - { id: 81, class: vr128, preferred-register: '' }
  - { id: 82, class: vr128, preferred-register: '' }
  - { id: 83, class: vr128, preferred-register: '' }
  - { id: 84, class: vr128, preferred-register: '' }
  - { id: 85, class: vr128, preferred-register: '' }
  - { id: 86, class: vr128, preferred-register: '' }
  - { id: 87, class: vr128, preferred-register: '' }
  - { id: 88, class: vr128, preferred-register: '' }
  - { id: 89, class: vr128, preferred-register: '' }
  - { id: 90, class: vr128, preferred-register: '' }
  - { id: 91, class: vr128, preferred-register: '' }
  - { id: 92, class: vr128, preferred-register: '' }
  - { id: 93, class: vr128, preferred-register: '' }
  - { id: 94, class: vr128, preferred-register: '' }
  - { id: 95, class: vr128, preferred-register: '' }
  - { id: 96, class: vr128, preferred-register: '' }
  - { id: 97, class: vr128, preferred-register: '' }
  - { id: 98, class: vr128, preferred-register: '' }
  - { id: 99, class: vr128, preferred-register: '' }
  - { id: 100, class: vr128, preferred-register: '' }
  - { id: 101, class: gr32, preferred-register: '' }
  - { id: 102, class: gr32, preferred-register: '' }
  - { id: 103, class: gr64_nosp, preferred-register: '' }
  - { id: 104, class: gr64, preferred-register: '' }
  - { id: 105, class: gr64, preferred-register: '' }
  - { id: 106, class: vr128, preferred-register: '' }
  - { id: 107, class: gr64_nosp, preferred-register: '' }
  - { id: 108, class: gr64, preferred-register: '' }
  - { id: 109, class: gr64, preferred-register: '' }
  - { id: 110, class: fr64, preferred-register: '' }
  - { id: 111, class: vr128, preferred-register: '' }
  - { id: 112, class: vr128, preferred-register: '' }
  - { id: 113, class: vr128, preferred-register: '' }
  - { id: 114, class: gr64_nosp, preferred-register: '' }
  - { id: 115, class: gr64, preferred-register: '' }
  - { id: 116, class: gr64, preferred-register: '' }
  - { id: 117, class: fr64, preferred-register: '' }
  - { id: 118, class: vr128, preferred-register: '' }
  - { id: 119, class: gr32, preferred-register: '' }
  - { id: 120, class: gr32, preferred-register: '' }
  - { id: 121, class: gr32, preferred-register: '' }
  - { id: 122, class: gr32, preferred-register: '' }
liveins:
  - { reg: '$edi', virtual-reg: '%0' }
  - { reg: '$rsi', virtual-reg: '%2' }
frameInfo:
  isFrameAddressTaken: false
  isReturnAddressTaken: false
  hasStackMap:     false
  hasPatchPoint:   false
  stackSize:       0
  offsetAdjustment: 0
  maxAlignment:    16
  adjustsStack:    false
  hasCalls:        true
  stackProtector:  '%stack.0.StackGuardSlot'
  maxCallFrameSize: 4294967295
  cvBytesOfCalleeSavedRegisters: 0
  hasOpaqueSPAdjustment: false
  hasVAStart:      false
  hasMustTailInVarArgFunc: false
  hasTailCall:     false
  localFrameSize:  0
  savePoint:       ''
  restorePoint:    ''
fixedStack:      []
stack:
  - { id: 0, name: StackGuardSlot, type: default, offset: 0, size: 8, alignment: 8, 
      stack-id: default, callee-saved-register: '', callee-saved-restored: true, 
      debug-info-variable: '', debug-info-expression: '', debug-info-location: '' }
  - { id: 1, name: '', type: default, offset: 0, size: 8, alignment: 8, 
      stack-id: default, callee-saved-register: '', callee-saved-restored: true, 
      debug-info-variable: '', debug-info-expression: '', debug-info-location: '' }
  - { id: 2, name: '', type: default, offset: 0, size: 16, alignment: 16, 
      stack-id: default, callee-saved-register: '', callee-saved-restored: true, 
      debug-info-variable: '', debug-info-expression: '', debug-info-location: '' }
  - { id: 3, name: '', type: default, offset: 0, size: 8, alignment: 8, 
      stack-id: default, callee-saved-register: '', callee-saved-restored: true, 
      debug-info-variable: '', debug-info-expression: '', debug-info-location: '' }
  - { id: 4, name: '', type: default, offset: 0, size: 16, alignment: 16, 
      stack-id: default, callee-saved-register: '', callee-saved-restored: true, 
      debug-info-variable: '', debug-info-expression: '', debug-info-location: '' }
  - { id: 5, name: '', type: default, offset: 0, size: 16, alignment: 16, 
      stack-id: default, callee-saved-register: '', callee-saved-restored: true, 
      debug-info-variable: '', debug-info-expression: '', debug-info-location: '' }
  - { id: 6, name: '', type: default, offset: 0, size: 16, alignment: 16, 
      stack-id: default, callee-saved-register: '', callee-saved-restored: true, 
      debug-info-variable: '', debug-info-expression: '', debug-info-location: '' }
  - { id: 7, name: '', type: default, offset: 0, size: 16, alignment: 16, 
      stack-id: default, callee-saved-register: '', callee-saved-restored: true, 
      debug-info-variable: '', debug-info-expression: '', debug-info-location: '' }
  - { id: 8, name: '', type: default, offset: 0, size: 16, alignment: 16, 
      stack-id: default, callee-saved-register: '', callee-saved-restored: true, 
      debug-info-variable: '', debug-info-expression: '', debug-info-location: '' }
  - { id: 9, name: '', type: default, offset: 0, size: 16, alignment: 16, 
      stack-id: default, callee-saved-register: '', callee-saved-restored: true, 
      debug-info-variable: '', debug-info-expression: '', debug-info-location: '' }
  - { id: 10, name: '', type: default, offset: 0, size: 16, alignment: 16, 
      stack-id: default, callee-saved-register: '', callee-saved-restored: true, 
      debug-info-variable: '', debug-info-expression: '', debug-info-location: '' }
  - { id: 11, name: '', type: default, offset: 0, size: 16, alignment: 16, 
      stack-id: default, callee-saved-register: '', callee-saved-restored: true, 
      debug-info-variable: '', debug-info-expression: '', debug-info-location: '' }
  - { id: 12, name: '', type: default, offset: 0, size: 16, alignment: 16, 
      stack-id: default, callee-saved-register: '', callee-saved-restored: true, 
      debug-info-variable: '', debug-info-expression: '', debug-info-location: '' }
  - { id: 13, name: '', type: default, offset: 0, size: 8, alignment: 8, 
      stack-id: default, callee-saved-register: '', callee-saved-restored: true, 
      debug-info-variable: '', debug-info-expression: '', debug-info-location: '' }
  - { id: 14, name: '', type: default, offset: 0, size: 8, alignment: 8, 
      stack-id: default, callee-saved-register: '', callee-saved-restored: true, 
      debug-info-variable: '', debug-info-expression: '', debug-info-location: '' }
  - { id: 15, name: '', type: default, offset: 0, size: 16, alignment: 16, 
      stack-id: default, callee-saved-register: '', callee-saved-restored: true, 
      debug-info-variable: '', debug-info-expression: '', debug-info-location: '' }
  - { id: 16, name: '', type: default, offset: 0, size: 8, alignment: 8, 
      stack-id: default, callee-saved-register: '', callee-saved-restored: true, 
      debug-info-variable: '', debug-info-expression: '', debug-info-location: '' }
  - { id: 17, name: '', type: default, offset: 0, size: 8, alignment: 8, 
      stack-id: default, callee-saved-register: '', callee-saved-restored: true, 
      debug-info-variable: '', debug-info-expression: '', debug-info-location: '' }
  - { id: 18, name: '', type: default, offset: 0, size: 16, alignment: 16, 
      stack-id: default, callee-saved-register: '', callee-saved-restored: true, 
      debug-info-variable: '', debug-info-expression: '', debug-info-location: '' }
  - { id: 19, name: '', type: default, offset: 0, size: 8, alignment: 8, 
      stack-id: default, callee-saved-register: '', callee-saved-restored: true, 
      debug-info-variable: '', debug-info-expression: '', debug-info-location: '' }
  - { id: 20, name: '', type: default, offset: 0, size: 8, alignment: 8, 
      stack-id: default, callee-saved-register: '', callee-saved-restored: true, 
      debug-info-variable: '', debug-info-expression: '', debug-info-location: '' }
  - { id: 21, name: '', type: default, offset: 0, size: 8, alignment: 8, 
      stack-id: default, callee-saved-register: '', callee-saved-restored: true, 
      debug-info-variable: '', debug-info-expression: '', debug-info-location: '' }
  - { id: 22, name: '', type: default, offset: 0, size: 4, alignment: 4, 
      stack-id: default, callee-saved-register: '', callee-saved-restored: true, 
      debug-info-variable: '', debug-info-expression: '', debug-info-location: '' }
  - { id: 23, name: '', type: default, offset: 0, size: 4, alignment: 4, 
      stack-id: default, callee-saved-register: '', callee-saved-restored: true, 
      debug-info-variable: '', debug-info-expression: '', debug-info-location: '' }
  - { id: 24, name: '', type: default, offset: 0, size: 8, alignment: 8, 
      stack-id: default, callee-saved-register: '', callee-saved-restored: true, 
      debug-info-variable: '', debug-info-expression: '', debug-info-location: '' }
  - { id: 25, name: '', type: default, offset: 0, size: 32, alignment: 16, 
      stack-id: default, callee-saved-register: '', callee-saved-restored: true, 
      debug-info-variable: '', debug-info-expression: '', debug-info-location: '' }
  - { id: 26, name: '', type: default, offset: 0, size: 32, alignment: 16, 
      stack-id: default, callee-saved-register: '', callee-saved-restored: true, 
      debug-info-variable: '', debug-info-expression: '', debug-info-location: '' }
  - { id: 27, name: '', type: default, offset: 0, size: 32, alignment: 16, 
      stack-id: default, callee-saved-register: '', callee-saved-restored: true, 
      debug-info-variable: '', debug-info-expression: '', debug-info-location: '' }
  - { id: 28, name: '', type: default, offset: 0, size: 4, alignment: 4, 
      stack-id: default, callee-saved-register: '', callee-saved-restored: true, 
      debug-info-variable: '', debug-info-expression: '', debug-info-location: '' }
  - { id: 29, name: '', type: default, offset: 0, size: 4, alignment: 4, 
      stack-id: default, callee-saved-register: '', callee-saved-restored: true, 
      debug-info-variable: '', debug-info-expression: '', debug-info-location: '' }
  - { id: 30, name: '', type: default, offset: 0, size: 4, alignment: 4, 
      stack-id: default, callee-saved-register: '', callee-saved-restored: true, 
      debug-info-variable: '', debug-info-expression: '', debug-info-location: '' }
  - { id: 31, name: '', type: default, offset: 0, size: 16, alignment: 16, 
      stack-id: default, callee-saved-register: '', callee-saved-restored: true, 
      debug-info-variable: '', debug-info-expression: '', debug-info-location: '' }
  - { id: 32, name: '', type: default, offset: 0, size: 16, alignment: 16, 
      stack-id: default, callee-saved-register: '', callee-saved-restored: true, 
      debug-info-variable: '', debug-info-expression: '', debug-info-location: '' }
  - { id: 33, name: '', type: default, offset: 0, size: 16, alignment: 16, 
      stack-id: default, callee-saved-register: '', callee-saved-restored: true, 
      debug-info-variable: '', debug-info-expression: '', debug-info-location: '' }
  - { id: 34, name: '', type: default, offset: 0, size: 16, alignment: 16, 
      stack-id: default, callee-saved-register: '', callee-saved-restored: true, 
      debug-info-variable: '', debug-info-expression: '', debug-info-location: '' }
  - { id: 35, name: '', type: default, offset: 0, size: 16, alignment: 16, 
      stack-id: default, callee-saved-register: '', callee-saved-restored: true, 
      debug-info-variable: '', debug-info-expression: '', debug-info-location: '' }
callSites:       []
debugValueSubstitutions: []
constants:
  - id:              0
    value:           'double 4.000000e+00'
    alignment:       8
    isTargetSpecific: false
  - id:              1
    value:           'double 3.000000e+00'
    alignment:       8
    isTargetSpecific: false
  - id:              2
    value:           'double 2.000000e+00'
    alignment:       8
    isTargetSpecific: false
  - id:              3
    value:           'double 1.000000e+00'
    alignment:       8
    isTargetSpecific: false
machineFunctionInfo: {}
body:             |
  bb.0 (%ir-block.2):
    successors: %bb.1(0x80000000)
    liveins: $edi, $rsi
  
    %2:gr64 = COPY $rsi
    %0:gr32 = COPY $edi
    %1:gr32 = COPY killed %0
    %3:gr64 = COPY killed %2
    %31:gr64 = LOAD_STACK_GUARD :: (dereferenceable invariant load (s64) from @__stack_chk_guard)
    MOV64mr %stack.0.StackGuardSlot, 1, $noreg, 0, $noreg, %31
    MOV32mi %stack.22, 1, $noreg, 0, $noreg, 0 :: (store (s32) into %ir.25)
    MOV32mr %stack.23, 1, $noreg, 0, $noreg, %1 :: (store (s32) into %ir.26)
    MOV64mr %stack.24, 1, $noreg, 0, $noreg, %3 :: (store (s64) into %ir.27)
    MOV32mi %stack.28, 1, $noreg, 0, $noreg, 2 :: (store (s32) into %ir.31)
    MOV32mi %stack.29, 1, $noreg, 0, $noreg, 2 :: (store (s32) into %ir.32)
    MOV32mi %stack.30, 1, $noreg, 0, $noreg, 0 :: (store (s32) into %ir.33)
    %30:fr64 = MOVSDrm_alt $rip, 1, $noreg, %const.3, $noreg
    MOVSDmr %stack.25, 1, $noreg, 0, $noreg, %30 :: (store (s64) into %ir.39, align 16)
    %29:fr64 = FsFLD0SD
    MOVSDmr %stack.25, 1, $noreg, 8, $noreg, %29 :: (store (s64) into %ir.40)
    %28:fr64 = FsFLD0SD
    MOVSDmr %stack.25, 1, $noreg, 16, $noreg, %28 :: (store (s64) into %ir.41, align 16)
    %27:fr64 = MOVSDrm_alt $rip, 1, $noreg, %const.3, $noreg
    MOVSDmr %stack.25, 1, $noreg, 24, $noreg, %27 :: (store (s64) into %ir.42)
    %26:fr64 = MOVSDrm_alt $rip, 1, $noreg, %const.3, $noreg
    MOVSDmr %stack.26, 1, $noreg, 0, $noreg, %26 :: (store (s64) into %ir.43, align 16)
    %25:fr64 = MOVSDrm_alt $rip, 1, $noreg, %const.2, $noreg
    MOVSDmr %stack.26, 1, $noreg, 8, $noreg, %25 :: (store (s64) into %ir.44)
    %24:fr64 = MOVSDrm_alt $rip, 1, $noreg, %const.1, $noreg
    MOVSDmr %stack.26, 1, $noreg, 16, $noreg, %24 :: (store (s64) into %ir.45, align 16)
    %23:fr64 = MOVSDrm_alt $rip, 1, $noreg, %const.0, $noreg
    MOVSDmr %stack.26, 1, $noreg, 24, $noreg, %23 :: (store (s64) into %ir.46)
    %22:fr64 = FsFLD0SD
    MOVSDmr %stack.27, 1, $noreg, 0, $noreg, %22 :: (store (s64) into %ir.47, align 16)
    %21:fr64 = FsFLD0SD
    MOVSDmr %stack.27, 1, $noreg, 8, $noreg, %21 :: (store (s64) into %ir.48)
    %20:fr64 = FsFLD0SD
    MOVSDmr %stack.27, 1, $noreg, 16, $noreg, %20 :: (store (s64) into %ir.49, align 16)
    %19:fr64 = FsFLD0SD
    MOVSDmr %stack.27, 1, $noreg, 24, $noreg, %19 :: (store (s64) into %ir.50)
    %18:gr64 = LEA64r %stack.27, 1, $noreg, 0, $noreg
    MOV64mr %stack.19, 1, $noreg, 0, $noreg, %18 :: (store (s64) into %ir.22)
    %15:gr64 = MOV64rm %stack.19, 1, $noreg, 0, $noreg :: (load (s64) from %ir.22)
    %14:vr128 = MOVAPDrm %15, 1, $noreg, 0, $noreg :: (load (s128) from %ir.54)
    MOVAPDmr %stack.31, 1, $noreg, 0, $noreg, %14 :: (store (s128) into %ir.34)
    %11:gr64 = LEA64r %stack.27, 1, $noreg, 0, $noreg
    %10:gr64 = ADD64ri8 %11, 16, implicit-def $eflags
    MOV64mr %stack.20, 1, $noreg, 0, $noreg, %10 :: (store (s64) into %ir.23)
    %7:gr64 = MOV64rm %stack.20, 1, $noreg, 0, $noreg :: (load (s64) from %ir.23)
    %6:vr128 = MOVAPDrm %7, 1, $noreg, 0, $noreg :: (load (s128) from %ir.59)
    MOVAPDmr %stack.32, 1, $noreg, 0, $noreg, %6 :: (store (s128) into %ir.35)
    MOV32mi %stack.30, 1, $noreg, 0, $noreg, 0 :: (store (s32) into %ir.33)
  
  bb.1 (%ir-block.61):
    successors: %bb.4(0x40000000), %bb.2(0x40000000)
  
    CMP32mi8 %stack.30, 1, $noreg, 0, $noreg, 2, implicit-def $eflags :: (load (s32) from %ir.33)
    JCC_1 %bb.4, 13, implicit $eflags
  
  bb.2 (%ir-block.64):
    successors: %bb.3(0x80000000)
  
    %101:gr32 = MOV32rm %stack.30, 1, $noreg, 0, $noreg :: (dereferenceable load (s32) from %ir.33)
    %102:gr32 = ADD32rr %101, %101, implicit-def dead $eflags
    %103:gr64_nosp = MOVSX64rr32 killed %102
    %104:gr64 = LEA64r %stack.25, 8, killed %103, 0, $noreg
    MOV64mr %stack.21, 1, $noreg, 0, $noreg, killed %104 :: (store (s64) into %ir.24)
    %105:gr64 = MOV64rm %stack.21, 1, $noreg, 0, $noreg :: (dereferenceable load (s64) from %ir.24)
    %106:vr128 = MOVAPDrm killed %105, 1, $noreg, 0, $noreg :: (load (s128) from %ir.71)
    MOVAPDmr %stack.33, 1, $noreg, 0, $noreg, killed %106 :: (store (s128) into %ir.36)
    %107:gr64_nosp = MOVSX64rm32 %stack.30, 1, $noreg, 0, $noreg :: (dereferenceable load (s32) from %ir.33)
    %108:gr64 = LEA64r %stack.26, 8, killed %107, 0, $noreg
    MOV64mr %stack.13, 1, $noreg, 0, $noreg, killed %108 :: (store (s64) into %ir.16)
    %109:gr64 = MOV64rm %stack.13, 1, $noreg, 0, $noreg :: (dereferenceable load (s64) from %ir.16)
    %110:fr64 = MOVSDrm_alt killed %109, 1, $noreg, 0, $noreg :: (load (s64) from %ir.80, align 1)
    MOVSDmr %stack.14, 1, $noreg, 0, $noreg, killed %110 :: (store (s64) into %ir.17)
    %111:vr128 = MOVSDrm %stack.14, 1, $noreg, 0, $noreg :: (dereferenceable load (s64) from %ir.17)
    %112:vr128 = MOVDDUPrr killed %111
    MOVAPDmr %stack.15, 1, $noreg, 0, $noreg, killed %112 :: (store (s128) into %ir.18)
    %113:vr128 = MOVAPDrm %stack.15, 1, $noreg, 0, $noreg :: (dereferenceable load (s128) from %ir.18)
    MOVAPDmr %stack.34, 1, $noreg, 0, $noreg, killed %113 :: (store (s128) into %ir.37)
    %114:gr64_nosp = MOVSX64rm32 %stack.30, 1, $noreg, 0, $noreg :: (dereferenceable load (s32) from %ir.33)
    %115:gr64 = nuw LEA64r %stack.26, 8, killed %114, 16, $noreg
    MOV64mr %stack.16, 1, $noreg, 0, $noreg, killed %115 :: (store (s64) into %ir.19)
    %116:gr64 = MOV64rm %stack.16, 1, $noreg, 0, $noreg :: (dereferenceable load (s64) from %ir.19)
    %117:fr64 = MOVSDrm_alt killed %116, 1, $noreg, 0, $noreg :: (load (s64) from %ir.94, align 1)
    MOVSDmr %stack.17, 1, $noreg, 0, $noreg, killed %117 :: (store (s64) into %ir.20)
    %118:vr128 = MOVSDrm %stack.17, 1, $noreg, 0, $noreg :: (dereferenceable load (s64) from %ir.20)
    %100:vr128 = MOVDDUPrr killed %118
    MOVAPDmr %stack.18, 1, $noreg, 0, $noreg, %100 :: (store (s128) into %ir.21)
    %99:vr128 = MOVAPDrm %stack.18, 1, $noreg, 0, $noreg :: (load (s128) from %ir.21)
    MOVAPDmr %stack.35, 1, $noreg, 0, $noreg, %99 :: (store (s128) into %ir.38)
    %97:vr128 = MOVAPDrm %stack.31, 1, $noreg, 0, $noreg :: (load (s128) from %ir.34)
    %96:vr128 = MOVAPDrm %stack.33, 1, $noreg, 0, $noreg :: (load (s128) from %ir.36)
    %95:vr128 = MOVAPDrm %stack.34, 1, $noreg, 0, $noreg :: (load (s128) from %ir.37)
    MOVAPDmr %stack.5, 1, $noreg, 0, $noreg, %96 :: (store (s128) into %ir.8)
    MOVAPDmr %stack.6, 1, $noreg, 0, $noreg, %95 :: (store (s128) into %ir.9)
    %92:vr128 = MOVAPDrm %stack.5, 1, $noreg, 0, $noreg :: (load (s128) from %ir.8)
    %91:vr128 = MULPDrm %92, %stack.6, 1, $noreg, 0, $noreg, implicit $mxcsr :: (load (s128) from %ir.9)
    MOVAPDmr %stack.9, 1, $noreg, 0, $noreg, %97 :: (store (s128) into %ir.12)
    MOVAPDmr %stack.10, 1, $noreg, 0, $noreg, %91 :: (store (s128) into %ir.13)
    %86:vr128 = MOVAPDrm %stack.9, 1, $noreg, 0, $noreg :: (load (s128) from %ir.12)
    %85:vr128 = ADDPDrm %86, %stack.10, 1, $noreg, 0, $noreg, implicit $mxcsr :: (load (s128) from %ir.13)
    MOVAPDmr %stack.31, 1, $noreg, 0, $noreg, %85 :: (store (s128) into %ir.34)
    %81:vr128 = MOVAPDrm %stack.32, 1, $noreg, 0, $noreg :: (load (s128) from %ir.35)
    %80:vr128 = MOVAPDrm %stack.33, 1, $noreg, 0, $noreg :: (load (s128) from %ir.36)
    %79:vr128 = MOVAPDrm %stack.35, 1, $noreg, 0, $noreg :: (load (s128) from %ir.38)
    MOVAPDmr %stack.7, 1, $noreg, 0, $noreg, %80 :: (store (s128) into %ir.10)
    MOVAPDmr %stack.8, 1, $noreg, 0, $noreg, %79 :: (store (s128) into %ir.11)
    %76:vr128 = MOVAPDrm %stack.7, 1, $noreg, 0, $noreg :: (load (s128) from %ir.10)
    %75:vr128 = MULPDrm %76, %stack.8, 1, $noreg, 0, $noreg, implicit $mxcsr :: (load (s128) from %ir.11)
    MOVAPDmr %stack.11, 1, $noreg, 0, $noreg, %81 :: (store (s128) into %ir.14)
    MOVAPDmr %stack.12, 1, $noreg, 0, $noreg, %75 :: (store (s128) into %ir.15)
    %70:vr128 = MOVAPDrm %stack.11, 1, $noreg, 0, $noreg :: (load (s128) from %ir.14)
    %69:vr128 = ADDPDrm %70, %stack.12, 1, $noreg, 0, $noreg, implicit $mxcsr :: (load (s128) from %ir.15)
    MOVAPDmr %stack.32, 1, $noreg, 0, $noreg, %69 :: (store (s128) into %ir.35)
  
  bb.3 (%ir-block.119):
    successors: %bb.1(0x80000000)
  
    %122:gr32 = MOV32rm %stack.30, 1, $noreg, 0, $noreg :: (load (s32) from %ir.33)
    %121:gr32 = ADD32ri8 %122, 1, implicit-def $eflags
    MOV32mr %stack.30, 1, $noreg, 0, $noreg, %121 :: (store (s32) into %ir.33)
    JMP_1 %bb.1
  
  bb.4 (%ir-block.122):
    successors: %bb.5(0x7ffff800), %bb.6(0x00000800)
  
    %62:gr64 = LEA64r %stack.27, 1, $noreg, 0, $noreg
    %60:vr128 = MOVAPDrm %stack.31, 1, $noreg, 0, $noreg :: (load (s128) from %ir.34)
    MOV64mr %stack.1, 1, $noreg, 0, $noreg, %62 :: (store (s64) into %ir.4)
    MOVAPDmr %stack.2, 1, $noreg, 0, $noreg, %60 :: (store (s128) into %ir.5)
    %57:vr128 = MOVAPDrm %stack.2, 1, $noreg, 0, $noreg :: (load (s128) from %ir.5)
    %56:gr64 = MOV64rm %stack.1, 1, $noreg, 0, $noreg :: (load (s64) from %ir.4)
    MOVAPDmr %56, 1, $noreg, 0, $noreg, %57 :: (store (s128) into %ir.128)
    %53:gr64 = LEA64r %stack.27, 1, $noreg, 0, $noreg
    %52:gr64 = ADD64ri8 %53, 16, implicit-def $eflags
    %50:vr128 = MOVAPDrm %stack.32, 1, $noreg, 0, $noreg :: (load (s128) from %ir.35)
    MOV64mr %stack.3, 1, $noreg, 0, $noreg, %52 :: (store (s64) into %ir.6)
    MOVAPDmr %stack.4, 1, $noreg, 0, $noreg, %50 :: (store (s128) into %ir.7)
    %47:vr128 = MOVAPDrm %stack.4, 1, $noreg, 0, $noreg :: (load (s128) from %ir.7)
    %46:gr64 = MOV64rm %stack.3, 1, $noreg, 0, $noreg :: (load (s64) from %ir.6)
    MOVAPDmr %46, 1, $noreg, 0, $noreg, %47 :: (store (s128) into %ir.134)
    %43:fr64 = MOVSDrm_alt %stack.27, 1, $noreg, 0, $noreg :: (load (s64) from %ir.135, align 16)
    %42:fr64 = MOVSDrm_alt %stack.27, 1, $noreg, 16, $noreg :: (load (s64) from %ir.137, align 16)
    %41:fr64 = MOVSDrm_alt %stack.27, 1, $noreg, 8, $noreg :: (load (s64) from %ir.139)
    %40:fr64 = MOVSDrm_alt %stack.27, 1, $noreg, 24, $noreg :: (load (s64) from %ir.141)
    %34:gr64 = LEA64r $rip, 1, $noreg, @.str, $noreg
    ADJCALLSTACKDOWN64 0, 0, 0, implicit-def $rsp, implicit-def $eflags, implicit-def $ssp, implicit $rsp, implicit $ssp
    $rdi = COPY %34
    $xmm0 = COPY %43
    $xmm1 = COPY %42
    $xmm2 = COPY %41
    $xmm3 = COPY %40
    $al = MOV8ri 4
    CALL64pcrel32 @printf, csr_64, implicit $rsp, implicit $ssp, implicit $al, implicit $rdi, implicit $xmm0, implicit $xmm1, implicit $xmm2, implicit $xmm3, implicit-def $eax
    ADJCALLSTACKUP64 0, 0, implicit-def $rsp, implicit-def $eflags, implicit-def $ssp, implicit $rsp, implicit $ssp
    %39:gr32 = COPY $eax
    %33:gr32 = MOV32r0 implicit-def $eflags
    %63:gr64 = MOV64rm %stack.0.StackGuardSlot, 1, $noreg, 0, $noreg :: (volatile load (s64) from %stack.0.StackGuardSlot)
    %64:gr64 = LOAD_STACK_GUARD :: (dereferenceable invariant load (s64) from @__stack_chk_guard)
    %65:gr64 = SUB64rr %64, killed %63, implicit-def $eflags
    JCC_1 %bb.6, 5, implicit $eflags
    JMP_1 %bb.5
  
  bb.6 (%ir-block.122):
    successors: 
  
    ADJCALLSTACKDOWN64 0, 0, 0, implicit-def dead $rsp, implicit-def dead $eflags, implicit-def dead $ssp, implicit $rsp, implicit $ssp
    CALL64pcrel32 &__stack_chk_fail, csr_64, implicit $rsp, implicit $ssp, implicit-def $rsp, implicit-def $ssp
    ADJCALLSTACKUP64 0, 0, implicit-def dead $rsp, implicit-def dead $eflags, implicit-def dead $ssp, implicit $rsp, implicit $ssp
  
  bb.5 (%ir-block.122):
    $eax = COPY %33
    RET64 implicit $eax

...
