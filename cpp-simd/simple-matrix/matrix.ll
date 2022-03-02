; ModuleID = 'matrix.c'
source_filename = "matrix.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

%struct.__mm_load1_pd_struct = type { double }

@.str = private unnamed_addr constant [15 x i8] c"%g, %g\0A%g, %g\0A\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %0, i8** noundef %1) #0 !dbg !26 {
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
  call void @llvm.dbg.declare(metadata i32* %25, metadata !34, metadata !DIExpression()), !dbg !35
  store i8** %1, i8*** %26, align 8
  call void @llvm.dbg.declare(metadata i8*** %26, metadata !36, metadata !DIExpression()), !dbg !37
  call void @llvm.dbg.declare(metadata [4 x double]* %27, metadata !38, metadata !DIExpression()), !dbg !42
  call void @llvm.dbg.declare(metadata [4 x double]* %28, metadata !43, metadata !DIExpression()), !dbg !44
  call void @llvm.dbg.declare(metadata [4 x double]* %29, metadata !45, metadata !DIExpression()), !dbg !46
  call void @llvm.dbg.declare(metadata i32* %30, metadata !47, metadata !DIExpression()), !dbg !49
  store i32 2, i32* %30, align 4, !dbg !49
  call void @llvm.dbg.declare(metadata i32* %31, metadata !50, metadata !DIExpression()), !dbg !51
  store i32 2, i32* %31, align 4, !dbg !51
  call void @llvm.dbg.declare(metadata i32* %32, metadata !52, metadata !DIExpression()), !dbg !53
  store i32 0, i32* %32, align 4, !dbg !53
  call void @llvm.dbg.declare(metadata <2 x double>* %33, metadata !54, metadata !DIExpression()), !dbg !55
  call void @llvm.dbg.declare(metadata <2 x double>* %34, metadata !56, metadata !DIExpression()), !dbg !57
  call void @llvm.dbg.declare(metadata <2 x double>* %35, metadata !58, metadata !DIExpression()), !dbg !59
  call void @llvm.dbg.declare(metadata <2 x double>* %36, metadata !60, metadata !DIExpression()), !dbg !61
  call void @llvm.dbg.declare(metadata <2 x double>* %37, metadata !62, metadata !DIExpression()), !dbg !63
  %38 = getelementptr inbounds [4 x double], [4 x double]* %27, i64 0, i64 0, !dbg !64
  store double 1.000000e+00, double* %38, align 16, !dbg !65
  %39 = getelementptr inbounds [4 x double], [4 x double]* %27, i64 0, i64 1, !dbg !66
  store double 0.000000e+00, double* %39, align 8, !dbg !67
  %40 = getelementptr inbounds [4 x double], [4 x double]* %27, i64 0, i64 2, !dbg !68
  store double 0.000000e+00, double* %40, align 16, !dbg !69
  %41 = getelementptr inbounds [4 x double], [4 x double]* %27, i64 0, i64 3, !dbg !70
  store double 1.000000e+00, double* %41, align 8, !dbg !71
  %42 = getelementptr inbounds [4 x double], [4 x double]* %28, i64 0, i64 0, !dbg !72
  store double 1.000000e+00, double* %42, align 16, !dbg !73
  %43 = getelementptr inbounds [4 x double], [4 x double]* %28, i64 0, i64 1, !dbg !74
  store double 2.000000e+00, double* %43, align 8, !dbg !75
  %44 = getelementptr inbounds [4 x double], [4 x double]* %28, i64 0, i64 2, !dbg !76
  store double 3.000000e+00, double* %44, align 16, !dbg !77
  %45 = getelementptr inbounds [4 x double], [4 x double]* %28, i64 0, i64 3, !dbg !78
  store double 4.000000e+00, double* %45, align 8, !dbg !79
  %46 = getelementptr inbounds [4 x double], [4 x double]* %29, i64 0, i64 0, !dbg !80
  store double 0.000000e+00, double* %46, align 16, !dbg !81
  %47 = getelementptr inbounds [4 x double], [4 x double]* %29, i64 0, i64 1, !dbg !82
  store double 0.000000e+00, double* %47, align 8, !dbg !83
  %48 = getelementptr inbounds [4 x double], [4 x double]* %29, i64 0, i64 2, !dbg !84
  store double 0.000000e+00, double* %48, align 16, !dbg !85
  %49 = getelementptr inbounds [4 x double], [4 x double]* %29, i64 0, i64 3, !dbg !86
  store double 0.000000e+00, double* %49, align 8, !dbg !87
  %50 = getelementptr inbounds [4 x double], [4 x double]* %29, i64 0, i64 0, !dbg !88
  %51 = getelementptr inbounds double, double* %50, i64 0, !dbg !89
  store double* %51, double** %21, align 8, !dbg !90
  %52 = load double*, double** %21, align 8, !dbg !90
  %53 = bitcast double* %52 to <2 x double>*, !dbg !90
  %54 = load <2 x double>, <2 x double>* %53, align 16, !dbg !90
  store <2 x double> %54, <2 x double>* %33, align 16, !dbg !91
  %55 = getelementptr inbounds [4 x double], [4 x double]* %29, i64 0, i64 0, !dbg !92
  %56 = getelementptr inbounds double, double* %55, i64 2, !dbg !93
  store double* %56, double** %22, align 8, !dbg !94
  %57 = load double*, double** %22, align 8, !dbg !94
  %58 = bitcast double* %57 to <2 x double>*, !dbg !94
  %59 = load <2 x double>, <2 x double>* %58, align 16, !dbg !94
  store <2 x double> %59, <2 x double>* %34, align 16, !dbg !95
  store i32 0, i32* %32, align 4, !dbg !96
  br label %60, !dbg !98

60:                                               ; preds = %118, %2
  %61 = load i32, i32* %32, align 4, !dbg !99
  %62 = icmp slt i32 %61, 2, !dbg !101
  br i1 %62, label %63, label %121, !dbg !102

63:                                               ; preds = %60
  %64 = getelementptr inbounds [4 x double], [4 x double]* %27, i64 0, i64 0, !dbg !103
  %65 = load i32, i32* %32, align 4, !dbg !105
  %66 = mul nsw i32 %65, 2, !dbg !106
  %67 = sext i32 %66 to i64, !dbg !107
  %68 = getelementptr inbounds double, double* %64, i64 %67, !dbg !107
  store double* %68, double** %23, align 8, !dbg !108
  %69 = load double*, double** %23, align 8, !dbg !108
  %70 = bitcast double* %69 to <2 x double>*, !dbg !108
  %71 = load <2 x double>, <2 x double>* %70, align 16, !dbg !108
  store <2 x double> %71, <2 x double>* %35, align 16, !dbg !109
  %72 = getelementptr inbounds [4 x double], [4 x double]* %28, i64 0, i64 0, !dbg !110
  %73 = load i32, i32* %32, align 4, !dbg !111
  %74 = sext i32 %73 to i64, !dbg !112
  %75 = getelementptr inbounds double, double* %72, i64 %74, !dbg !112
  %76 = getelementptr inbounds double, double* %75, i64 0, !dbg !113
  store double* %76, double** %15, align 8, !dbg !114
  %77 = load double*, double** %15, align 8, !dbg !114
  %78 = bitcast double* %77 to %struct.__mm_load1_pd_struct*, !dbg !114
  %79 = getelementptr inbounds %struct.__mm_load1_pd_struct, %struct.__mm_load1_pd_struct* %78, i32 0, i32 0, !dbg !114
  %80 = load double, double* %79, align 1, !dbg !114
  store double %80, double* %16, align 8, !dbg !114
  %81 = load double, double* %16, align 8, !dbg !114
  %82 = insertelement <2 x double> undef, double %81, i32 0, !dbg !114
  %83 = load double, double* %16, align 8, !dbg !114
  %84 = insertelement <2 x double> %82, double %83, i32 1, !dbg !114
  store <2 x double> %84, <2 x double>* %17, align 16, !dbg !114
  %85 = load <2 x double>, <2 x double>* %17, align 16, !dbg !114
  store <2 x double> %85, <2 x double>* %36, align 16, !dbg !115
  %86 = getelementptr inbounds [4 x double], [4 x double]* %28, i64 0, i64 0, !dbg !116
  %87 = load i32, i32* %32, align 4, !dbg !117
  %88 = sext i32 %87 to i64, !dbg !118
  %89 = getelementptr inbounds double, double* %86, i64 %88, !dbg !118
  %90 = getelementptr inbounds double, double* %89, i64 2, !dbg !119
  store double* %90, double** %18, align 8, !dbg !120
  %91 = load double*, double** %18, align 8, !dbg !120
  %92 = bitcast double* %91 to %struct.__mm_load1_pd_struct*, !dbg !120
  %93 = getelementptr inbounds %struct.__mm_load1_pd_struct, %struct.__mm_load1_pd_struct* %92, i32 0, i32 0, !dbg !120
  %94 = load double, double* %93, align 1, !dbg !120
  store double %94, double* %19, align 8, !dbg !120
  %95 = load double, double* %19, align 8, !dbg !120
  %96 = insertelement <2 x double> undef, double %95, i32 0, !dbg !120
  %97 = load double, double* %19, align 8, !dbg !120
  %98 = insertelement <2 x double> %96, double %97, i32 1, !dbg !120
  store <2 x double> %98, <2 x double>* %20, align 16, !dbg !120
  %99 = load <2 x double>, <2 x double>* %20, align 16, !dbg !120
  store <2 x double> %99, <2 x double>* %37, align 16, !dbg !121
  %100 = load <2 x double>, <2 x double>* %33, align 16, !dbg !122
  %101 = load <2 x double>, <2 x double>* %35, align 16, !dbg !123
  %102 = load <2 x double>, <2 x double>* %36, align 16, !dbg !124
  store <2 x double> %101, <2 x double>* %7, align 16, !dbg !125
  store <2 x double> %102, <2 x double>* %8, align 16, !dbg !125
  %103 = load <2 x double>, <2 x double>* %7, align 16, !dbg !125
  %104 = load <2 x double>, <2 x double>* %8, align 16, !dbg !125
  %105 = fmul <2 x double> %103, %104, !dbg !125
  store <2 x double> %100, <2 x double>* %11, align 16, !dbg !126
  store <2 x double> %105, <2 x double>* %12, align 16, !dbg !126
  %106 = load <2 x double>, <2 x double>* %11, align 16, !dbg !126
  %107 = load <2 x double>, <2 x double>* %12, align 16, !dbg !126
  %108 = fadd <2 x double> %106, %107, !dbg !126
  store <2 x double> %108, <2 x double>* %33, align 16, !dbg !127
  %109 = load <2 x double>, <2 x double>* %34, align 16, !dbg !128
  %110 = load <2 x double>, <2 x double>* %35, align 16, !dbg !129
  %111 = load <2 x double>, <2 x double>* %37, align 16, !dbg !130
  store <2 x double> %110, <2 x double>* %9, align 16, !dbg !131
  store <2 x double> %111, <2 x double>* %10, align 16, !dbg !131
  %112 = load <2 x double>, <2 x double>* %9, align 16, !dbg !131
  %113 = load <2 x double>, <2 x double>* %10, align 16, !dbg !131
  %114 = fmul <2 x double> %112, %113, !dbg !131
  store <2 x double> %109, <2 x double>* %13, align 16, !dbg !132
  store <2 x double> %114, <2 x double>* %14, align 16, !dbg !132
  %115 = load <2 x double>, <2 x double>* %13, align 16, !dbg !132
  %116 = load <2 x double>, <2 x double>* %14, align 16, !dbg !132
  %117 = fadd <2 x double> %115, %116, !dbg !132
  store <2 x double> %117, <2 x double>* %34, align 16, !dbg !133
  br label %118, !dbg !134

118:                                              ; preds = %63
  %119 = load i32, i32* %32, align 4, !dbg !135
  %120 = add nsw i32 %119, 1, !dbg !135
  store i32 %120, i32* %32, align 4, !dbg !135
  br label %60, !dbg !136, !llvm.loop !137

121:                                              ; preds = %60
  %122 = getelementptr inbounds [4 x double], [4 x double]* %29, i64 0, i64 0, !dbg !140
  %123 = getelementptr inbounds double, double* %122, i64 0, !dbg !141
  %124 = load <2 x double>, <2 x double>* %33, align 16, !dbg !142
  store double* %123, double** %3, align 8, !dbg !143
  store <2 x double> %124, <2 x double>* %4, align 16, !dbg !143
  %125 = load <2 x double>, <2 x double>* %4, align 16, !dbg !143
  %126 = load double*, double** %3, align 8, !dbg !143
  %127 = bitcast double* %126 to <2 x double>*, !dbg !143
  store <2 x double> %125, <2 x double>* %127, align 16, !dbg !143
  %128 = getelementptr inbounds [4 x double], [4 x double]* %29, i64 0, i64 0, !dbg !144
  %129 = getelementptr inbounds double, double* %128, i64 2, !dbg !145
  %130 = load <2 x double>, <2 x double>* %34, align 16, !dbg !146
  store double* %129, double** %5, align 8, !dbg !147
  store <2 x double> %130, <2 x double>* %6, align 16, !dbg !147
  %131 = load <2 x double>, <2 x double>* %6, align 16, !dbg !147
  %132 = load double*, double** %5, align 8, !dbg !147
  %133 = bitcast double* %132 to <2 x double>*, !dbg !147
  store <2 x double> %131, <2 x double>* %133, align 16, !dbg !147
  %134 = getelementptr inbounds [4 x double], [4 x double]* %29, i64 0, i64 0, !dbg !148
  %135 = load double, double* %134, align 16, !dbg !148
  %136 = getelementptr inbounds [4 x double], [4 x double]* %29, i64 0, i64 2, !dbg !149
  %137 = load double, double* %136, align 16, !dbg !149
  %138 = getelementptr inbounds [4 x double], [4 x double]* %29, i64 0, i64 1, !dbg !150
  %139 = load double, double* %138, align 8, !dbg !150
  %140 = getelementptr inbounds [4 x double], [4 x double]* %29, i64 0, i64 3, !dbg !151
  %141 = load double, double* %140, align 8, !dbg !151
  %142 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str, i64 0, i64 0), double noundef %135, double noundef %137, double noundef %139, double noundef %141), !dbg !152
  ret i32 0, !dbg !153
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @printf(i8* noundef, ...) #2

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="128" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1, !2, !3, !4, !5, !6}
!llvm.dbg.cu = !{!7}
!llvm.ident = !{!25}

!0 = !{i32 2, !"SDK Version", [2 x i32] [i32 12, i32 1]}
!1 = !{i32 7, !"Dwarf Version", i32 4}
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = !{i32 1, !"wchar_size", i32 4}
!4 = !{i32 7, !"PIC Level", i32 2}
!5 = !{i32 7, !"uwtable", i32 1}
!6 = !{i32 7, !"frame-pointer", i32 2}
!7 = distinct !DICompileUnit(language: DW_LANG_C99, file: !8, producer: "clang version 14.0.0 (https://github.com/llvm/llvm-project.git e7298464c5d004a119583cdb8a120dc3d968508d)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !9, splitDebugInlining: false, nameTableKind: None, sysroot: "/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX12.1.sdk", sdk: "MacOSX12.1.sdk")
!8 = !DIFile(filename: "matrix.c", directory: "/Users/haohua/Documents/GitHub/cs-nano-projects/cpp-simd/simple-matrix")
!9 = !{!10, !18, !12, !23, !24}
!10 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !11, size: 64)
!11 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !12)
!12 = !DIDerivedType(tag: DW_TAG_typedef, name: "__m128d", file: !13, line: 19, baseType: !14, align: 128)
!13 = !DIFile(filename: "/usr/local/lib/clang/14.0.0/include/emmintrin.h", directory: "")
!14 = !DICompositeType(tag: DW_TAG_array_type, baseType: !15, size: 128, flags: DIFlagVector, elements: !16)
!15 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!16 = !{!17}
!17 = !DISubrange(count: 2)
!18 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !19, size: 64)
!19 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !20)
!20 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__mm_load1_pd_struct", file: !13, line: 1603, size: 64, elements: !21)
!21 = !{!22}
!22 = !DIDerivedType(tag: DW_TAG_member, name: "__u", scope: !20, file: !13, line: 1604, baseType: !15, size: 64)
!23 = !DIDerivedType(tag: DW_TAG_typedef, name: "__v2df", file: !13, line: 26, baseType: !14)
!24 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !12, size: 64)
!25 = !{!"clang version 14.0.0 (https://github.com/llvm/llvm-project.git e7298464c5d004a119583cdb8a120dc3d968508d)"}
!26 = distinct !DISubprogram(name: "main", scope: !8, file: !8, line: 9, type: !27, scopeLine: 9, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !7, retainedNodes: !33)
!27 = !DISubroutineType(types: !28)
!28 = !{!29, !29, !30}
!29 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!30 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !31, size: 64)
!31 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !32, size: 64)
!32 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!33 = !{}
!34 = !DILocalVariable(name: "argc", arg: 1, scope: !26, file: !8, line: 9, type: !29)
!35 = !DILocation(line: 9, column: 14, scope: !26)
!36 = !DILocalVariable(name: "argv", arg: 2, scope: !26, file: !8, line: 9, type: !30)
!37 = !DILocation(line: 9, column: 26, scope: !26)
!38 = !DILocalVariable(name: "A", scope: !26, file: !8, line: 11, type: !39, align: 128)
!39 = !DICompositeType(tag: DW_TAG_array_type, baseType: !15, size: 256, elements: !40)
!40 = !{!41}
!41 = !DISubrange(count: 4)
!42 = !DILocation(line: 11, column: 41, scope: !26)
!43 = !DILocalVariable(name: "B", scope: !26, file: !8, line: 12, type: !39, align: 128)
!44 = !DILocation(line: 12, column: 41, scope: !26)
!45 = !DILocalVariable(name: "C", scope: !26, file: !8, line: 13, type: !39, align: 128)
!46 = !DILocation(line: 13, column: 41, scope: !26)
!47 = !DILocalVariable(name: "N", scope: !26, file: !8, line: 15, type: !48)
!48 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !29)
!49 = !DILocation(line: 15, column: 15, scope: !26)
!50 = !DILocalVariable(name: "M", scope: !26, file: !8, line: 16, type: !48)
!51 = !DILocation(line: 16, column: 15, scope: !26)
!52 = !DILocalVariable(name: "i", scope: !26, file: !8, line: 17, type: !29)
!53 = !DILocation(line: 17, column: 9, scope: !26)
!54 = !DILocalVariable(name: "c1", scope: !26, file: !8, line: 18, type: !12)
!55 = !DILocation(line: 18, column: 13, scope: !26)
!56 = !DILocalVariable(name: "c2", scope: !26, file: !8, line: 18, type: !12)
!57 = !DILocation(line: 18, column: 17, scope: !26)
!58 = !DILocalVariable(name: "a", scope: !26, file: !8, line: 18, type: !12)
!59 = !DILocation(line: 18, column: 21, scope: !26)
!60 = !DILocalVariable(name: "b1", scope: !26, file: !8, line: 18, type: !12)
!61 = !DILocation(line: 18, column: 24, scope: !26)
!62 = !DILocalVariable(name: "b2", scope: !26, file: !8, line: 18, type: !12)
!63 = !DILocation(line: 18, column: 28, scope: !26)
!64 = !DILocation(line: 21, column: 5, scope: !26)
!65 = !DILocation(line: 21, column: 10, scope: !26)
!66 = !DILocation(line: 21, column: 17, scope: !26)
!67 = !DILocation(line: 21, column: 22, scope: !26)
!68 = !DILocation(line: 21, column: 29, scope: !26)
!69 = !DILocation(line: 21, column: 34, scope: !26)
!70 = !DILocation(line: 21, column: 41, scope: !26)
!71 = !DILocation(line: 21, column: 46, scope: !26)
!72 = !DILocation(line: 23, column: 5, scope: !26)
!73 = !DILocation(line: 23, column: 10, scope: !26)
!74 = !DILocation(line: 23, column: 17, scope: !26)
!75 = !DILocation(line: 23, column: 22, scope: !26)
!76 = !DILocation(line: 23, column: 29, scope: !26)
!77 = !DILocation(line: 23, column: 34, scope: !26)
!78 = !DILocation(line: 23, column: 41, scope: !26)
!79 = !DILocation(line: 23, column: 46, scope: !26)
!80 = !DILocation(line: 25, column: 5, scope: !26)
!81 = !DILocation(line: 25, column: 10, scope: !26)
!82 = !DILocation(line: 25, column: 17, scope: !26)
!83 = !DILocation(line: 25, column: 22, scope: !26)
!84 = !DILocation(line: 25, column: 29, scope: !26)
!85 = !DILocation(line: 25, column: 34, scope: !26)
!86 = !DILocation(line: 25, column: 41, scope: !26)
!87 = !DILocation(line: 25, column: 46, scope: !26)
!88 = !DILocation(line: 28, column: 22, scope: !26)
!89 = !DILocation(line: 28, column: 23, scope: !26)
!90 = !DILocation(line: 28, column: 10, scope: !26)
!91 = !DILocation(line: 28, column: 8, scope: !26)
!92 = !DILocation(line: 29, column: 22, scope: !26)
!93 = !DILocation(line: 29, column: 23, scope: !26)
!94 = !DILocation(line: 29, column: 10, scope: !26)
!95 = !DILocation(line: 29, column: 8, scope: !26)
!96 = !DILocation(line: 31, column: 12, scope: !97)
!97 = distinct !DILexicalBlock(scope: !26, file: !8, line: 31, column: 5)
!98 = !DILocation(line: 31, column: 10, scope: !97)
!99 = !DILocation(line: 31, column: 17, scope: !100)
!100 = distinct !DILexicalBlock(scope: !97, file: !8, line: 31, column: 5)
!101 = !DILocation(line: 31, column: 19, scope: !100)
!102 = !DILocation(line: 31, column: 5, scope: !97)
!103 = !DILocation(line: 32, column: 25, scope: !104)
!104 = distinct !DILexicalBlock(scope: !100, file: !8, line: 31, column: 28)
!105 = !DILocation(line: 32, column: 27, scope: !104)
!106 = !DILocation(line: 32, column: 28, scope: !104)
!107 = !DILocation(line: 32, column: 26, scope: !104)
!108 = !DILocation(line: 32, column: 13, scope: !104)
!109 = !DILocation(line: 32, column: 11, scope: !104)
!110 = !DILocation(line: 33, column: 27, scope: !104)
!111 = !DILocation(line: 33, column: 29, scope: !104)
!112 = !DILocation(line: 33, column: 28, scope: !104)
!113 = !DILocation(line: 33, column: 30, scope: !104)
!114 = !DILocation(line: 33, column: 14, scope: !104)
!115 = !DILocation(line: 33, column: 12, scope: !104)
!116 = !DILocation(line: 34, column: 27, scope: !104)
!117 = !DILocation(line: 34, column: 29, scope: !104)
!118 = !DILocation(line: 34, column: 28, scope: !104)
!119 = !DILocation(line: 34, column: 30, scope: !104)
!120 = !DILocation(line: 34, column: 14, scope: !104)
!121 = !DILocation(line: 34, column: 12, scope: !104)
!122 = !DILocation(line: 35, column: 25, scope: !104)
!123 = !DILocation(line: 35, column: 40, scope: !104)
!124 = !DILocation(line: 35, column: 43, scope: !104)
!125 = !DILocation(line: 35, column: 29, scope: !104)
!126 = !DILocation(line: 35, column: 14, scope: !104)
!127 = !DILocation(line: 35, column: 12, scope: !104)
!128 = !DILocation(line: 36, column: 25, scope: !104)
!129 = !DILocation(line: 36, column: 40, scope: !104)
!130 = !DILocation(line: 36, column: 43, scope: !104)
!131 = !DILocation(line: 36, column: 29, scope: !104)
!132 = !DILocation(line: 36, column: 14, scope: !104)
!133 = !DILocation(line: 36, column: 12, scope: !104)
!134 = !DILocation(line: 37, column: 5, scope: !104)
!135 = !DILocation(line: 31, column: 25, scope: !100)
!136 = !DILocation(line: 31, column: 5, scope: !100)
!137 = distinct !{!137, !102, !138, !139}
!138 = !DILocation(line: 37, column: 5, scope: !97)
!139 = !{!"llvm.loop.mustprogress"}
!140 = !DILocation(line: 39, column: 18, scope: !26)
!141 = !DILocation(line: 39, column: 19, scope: !26)
!142 = !DILocation(line: 39, column: 25, scope: !26)
!143 = !DILocation(line: 39, column: 5, scope: !26)
!144 = !DILocation(line: 40, column: 18, scope: !26)
!145 = !DILocation(line: 40, column: 19, scope: !26)
!146 = !DILocation(line: 40, column: 25, scope: !26)
!147 = !DILocation(line: 40, column: 5, scope: !26)
!148 = !DILocation(line: 42, column: 32, scope: !26)
!149 = !DILocation(line: 42, column: 38, scope: !26)
!150 = !DILocation(line: 42, column: 44, scope: !26)
!151 = !DILocation(line: 42, column: 50, scope: !26)
!152 = !DILocation(line: 42, column: 5, scope: !26)
!153 = !DILocation(line: 44, column: 5, scope: !26)
