; ModuleID = 'hello-matrix.c'
source_filename = "hello-matrix.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

%struct.__mm_load1_pd_struct = type { double }

@.str = private unnamed_addr constant [15 x i8] c"%g, %g\0A%g, %g\0A\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %0, i8** noundef %1) #0 {
  %3 = alloca double*, align 8
  %4 = alloca <2 x double>, align 16
  %5 = alloca double*, align 8
  %6 = alloca <2 x double>, align 16
  %7 = alloca <2 x double>, align 16
  %8 = alloca <2 x double>, align 16
  %9 = alloca <2 x double>, align 16
  %10 = alloca <2 x double>, align 16
  %11 = alloca <2 x double>, align 16
  %12 = alloca <2 x double>, align 16
  %13 = alloca <2 x double>, align 16
  %14 = alloca <2 x double>, align 16
  %15 = alloca double*, align 8
  %16 = alloca double, align 8
  %17 = alloca <2 x double>, align 16
  %18 = alloca double*, align 8
  %19 = alloca double, align 8
  %20 = alloca <2 x double>, align 16
  %21 = alloca double*, align 8
  %22 = alloca double*, align 8
  %23 = alloca double*, align 8
  %24 = alloca i32, align 4
  %25 = alloca i32, align 4
  %26 = alloca i8**, align 8
  %27 = alloca [4 x double], align 16
  %28 = alloca [4 x double], align 16
  %29 = alloca [4 x double], align 16
  %30 = alloca i32, align 4
  %31 = alloca i32, align 4
  %32 = alloca i32, align 4
  %33 = alloca <2 x double>, align 16
  %34 = alloca <2 x double>, align 16
  %35 = alloca <2 x double>, align 16
  %36 = alloca <2 x double>, align 16
  %37 = alloca <2 x double>, align 16
  store i32 0, i32* %24, align 4
  store i32 %0, i32* %25, align 4
  store i8** %1, i8*** %26, align 8
  store i32 2, i32* %30, align 4
  store i32 2, i32* %31, align 4
  store i32 0, i32* %32, align 4
  %38 = getelementptr inbounds [4 x double], [4 x double]* %27, i64 0, i64 0
  store double 1.000000e+00, double* %38, align 16
  %39 = getelementptr inbounds [4 x double], [4 x double]* %27, i64 0, i64 1
  store double 0.000000e+00, double* %39, align 8
  %40 = getelementptr inbounds [4 x double], [4 x double]* %27, i64 0, i64 2
  store double 0.000000e+00, double* %40, align 16
  %41 = getelementptr inbounds [4 x double], [4 x double]* %27, i64 0, i64 3
  store double 1.000000e+00, double* %41, align 8
  %42 = getelementptr inbounds [4 x double], [4 x double]* %28, i64 0, i64 0
  store double 1.000000e+00, double* %42, align 16
  %43 = getelementptr inbounds [4 x double], [4 x double]* %28, i64 0, i64 1
  store double 2.000000e+00, double* %43, align 8
  %44 = getelementptr inbounds [4 x double], [4 x double]* %28, i64 0, i64 2
  store double 3.000000e+00, double* %44, align 16
  %45 = getelementptr inbounds [4 x double], [4 x double]* %28, i64 0, i64 3
  store double 4.000000e+00, double* %45, align 8
  %46 = getelementptr inbounds [4 x double], [4 x double]* %29, i64 0, i64 0
  store double 0.000000e+00, double* %46, align 16
  %47 = getelementptr inbounds [4 x double], [4 x double]* %29, i64 0, i64 1
  store double 0.000000e+00, double* %47, align 8
  %48 = getelementptr inbounds [4 x double], [4 x double]* %29, i64 0, i64 2
  store double 0.000000e+00, double* %48, align 16
  %49 = getelementptr inbounds [4 x double], [4 x double]* %29, i64 0, i64 3
  store double 0.000000e+00, double* %49, align 8
  %50 = getelementptr inbounds [4 x double], [4 x double]* %29, i64 0, i64 0
  %51 = getelementptr inbounds double, double* %50, i64 0
  store double* %51, double** %21, align 8
  %52 = load double*, double** %21, align 8
  %53 = bitcast double* %52 to <2 x double>*
  %54 = load <2 x double>, <2 x double>* %53, align 16
  store <2 x double> %54, <2 x double>* %33, align 16
  %55 = getelementptr inbounds [4 x double], [4 x double]* %29, i64 0, i64 0
  %56 = getelementptr inbounds double, double* %55, i64 2
  store double* %56, double** %22, align 8
  %57 = load double*, double** %22, align 8
  %58 = bitcast double* %57 to <2 x double>*
  %59 = load <2 x double>, <2 x double>* %58, align 16
  store <2 x double> %59, <2 x double>* %34, align 16
  store i32 0, i32* %32, align 4
  br label %60

60:                                               ; preds = %118, %2
  %61 = load i32, i32* %32, align 4
  %62 = icmp slt i32 %61, 2
  br i1 %62, label %63, label %121

63:                                               ; preds = %60
  %64 = getelementptr inbounds [4 x double], [4 x double]* %27, i64 0, i64 0
  %65 = load i32, i32* %32, align 4
  %66 = mul nsw i32 %65, 2
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds double, double* %64, i64 %67
  store double* %68, double** %23, align 8
  %69 = load double*, double** %23, align 8
  %70 = bitcast double* %69 to <2 x double>*
  %71 = load <2 x double>, <2 x double>* %70, align 16
  store <2 x double> %71, <2 x double>* %35, align 16
  %72 = getelementptr inbounds [4 x double], [4 x double]* %28, i64 0, i64 0
  %73 = load i32, i32* %32, align 4
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds double, double* %72, i64 %74
  %76 = getelementptr inbounds double, double* %75, i64 0
  store double* %76, double** %15, align 8
  %77 = load double*, double** %15, align 8
  %78 = bitcast double* %77 to %struct.__mm_load1_pd_struct*
  %79 = getelementptr inbounds %struct.__mm_load1_pd_struct, %struct.__mm_load1_pd_struct* %78, i32 0, i32 0
  %80 = load double, double* %79, align 1
  store double %80, double* %16, align 8
  %81 = load double, double* %16, align 8
  %82 = insertelement <2 x double> undef, double %81, i32 0
  %83 = load double, double* %16, align 8
  %84 = insertelement <2 x double> %82, double %83, i32 1
  store <2 x double> %84, <2 x double>* %17, align 16
  %85 = load <2 x double>, <2 x double>* %17, align 16
  store <2 x double> %85, <2 x double>* %36, align 16
  %86 = getelementptr inbounds [4 x double], [4 x double]* %28, i64 0, i64 0
  %87 = load i32, i32* %32, align 4
  %88 = sext i32 %87 to i64
  %89 = getelementptr inbounds double, double* %86, i64 %88
  %90 = getelementptr inbounds double, double* %89, i64 2
  store double* %90, double** %18, align 8
  %91 = load double*, double** %18, align 8
  %92 = bitcast double* %91 to %struct.__mm_load1_pd_struct*
  %93 = getelementptr inbounds %struct.__mm_load1_pd_struct, %struct.__mm_load1_pd_struct* %92, i32 0, i32 0
  %94 = load double, double* %93, align 1
  store double %94, double* %19, align 8
  %95 = load double, double* %19, align 8
  %96 = insertelement <2 x double> undef, double %95, i32 0
  %97 = load double, double* %19, align 8
  %98 = insertelement <2 x double> %96, double %97, i32 1
  store <2 x double> %98, <2 x double>* %20, align 16
  %99 = load <2 x double>, <2 x double>* %20, align 16
  store <2 x double> %99, <2 x double>* %37, align 16
  %100 = load <2 x double>, <2 x double>* %33, align 16
  %101 = load <2 x double>, <2 x double>* %35, align 16
  %102 = load <2 x double>, <2 x double>* %36, align 16
  store <2 x double> %101, <2 x double>* %7, align 16
  store <2 x double> %102, <2 x double>* %8, align 16
  %103 = load <2 x double>, <2 x double>* %7, align 16
  %104 = load <2 x double>, <2 x double>* %8, align 16
  %105 = fmul <2 x double> %103, %104
  store <2 x double> %100, <2 x double>* %11, align 16
  store <2 x double> %105, <2 x double>* %12, align 16
  %106 = load <2 x double>, <2 x double>* %11, align 16
  %107 = load <2 x double>, <2 x double>* %12, align 16
  %108 = fadd <2 x double> %106, %107
  store <2 x double> %108, <2 x double>* %33, align 16
  %109 = load <2 x double>, <2 x double>* %34, align 16
  %110 = load <2 x double>, <2 x double>* %35, align 16
  %111 = load <2 x double>, <2 x double>* %37, align 16
  store <2 x double> %110, <2 x double>* %9, align 16
  store <2 x double> %111, <2 x double>* %10, align 16
  %112 = load <2 x double>, <2 x double>* %9, align 16
  %113 = load <2 x double>, <2 x double>* %10, align 16
  %114 = fmul <2 x double> %112, %113
  store <2 x double> %109, <2 x double>* %13, align 16
  store <2 x double> %114, <2 x double>* %14, align 16
  %115 = load <2 x double>, <2 x double>* %13, align 16
  %116 = load <2 x double>, <2 x double>* %14, align 16
  %117 = fadd <2 x double> %115, %116
  store <2 x double> %117, <2 x double>* %34, align 16
  br label %118

118:                                              ; preds = %63
  %119 = load i32, i32* %32, align 4
  %120 = add nsw i32 %119, 1
  store i32 %120, i32* %32, align 4
  br label %60, !llvm.loop !6

121:                                              ; preds = %60
  %122 = getelementptr inbounds [4 x double], [4 x double]* %29, i64 0, i64 0
  %123 = getelementptr inbounds double, double* %122, i64 0
  %124 = load <2 x double>, <2 x double>* %33, align 16
  store double* %123, double** %3, align 8
  store <2 x double> %124, <2 x double>* %4, align 16
  %125 = load <2 x double>, <2 x double>* %4, align 16
  %126 = load double*, double** %3, align 8
  %127 = bitcast double* %126 to <2 x double>*
  store <2 x double> %125, <2 x double>* %127, align 16
  %128 = getelementptr inbounds [4 x double], [4 x double]* %29, i64 0, i64 0
  %129 = getelementptr inbounds double, double* %128, i64 2
  %130 = load <2 x double>, <2 x double>* %34, align 16
  store double* %129, double** %5, align 8
  store <2 x double> %130, <2 x double>* %6, align 16
  %131 = load <2 x double>, <2 x double>* %6, align 16
  %132 = load double*, double** %5, align 8
  %133 = bitcast double* %132 to <2 x double>*
  store <2 x double> %131, <2 x double>* %133, align 16
  %134 = getelementptr inbounds [4 x double], [4 x double]* %29, i64 0, i64 0
  %135 = load double, double* %134, align 16
  %136 = getelementptr inbounds [4 x double], [4 x double]* %29, i64 0, i64 2
  %137 = load double, double* %136, align 16
  %138 = getelementptr inbounds [4 x double], [4 x double]* %29, i64 0, i64 1
  %139 = load double, double* %138, align 8
  %140 = getelementptr inbounds [4 x double], [4 x double]* %29, i64 0, i64 3
  %141 = load double, double* %140, align 8
  %142 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str, i64 0, i64 0), double noundef %135, double noundef %137, double noundef %139, double noundef %141)
  ret i32 0
}

declare i32 @printf(i8* noundef, ...) #1

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="128" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

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
