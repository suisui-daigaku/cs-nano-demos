; ModuleID = 'example_for_call_count.c'
source_filename = "example_for_call_count.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @foo() #0 !dbg !10 {
  ret void, !dbg !14
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @bar() #0 !dbg !15 {
  call void @foo(), !dbg !16
  ret void, !dbg !17
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @fez() #0 !dbg !18 {
  call void @bar(), !dbg !19
  ret void, !dbg !20
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main() #0 !dbg !21 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 0, i32* %1, align 4
  call void @foo(), !dbg !25
  call void @bar(), !dbg !26
  call void @fez(), !dbg !27
  call void @llvm.dbg.declare(metadata i32* %2, metadata !28, metadata !DIExpression()), !dbg !29
  store i32 0, i32* %2, align 4, !dbg !29
  store i32 0, i32* %2, align 4, !dbg !30
  br label %3, !dbg !32

3:                                                ; preds = %7, %0
  %4 = load i32, i32* %2, align 4, !dbg !33
  %5 = icmp slt i32 %4, 10, !dbg !35
  br i1 %5, label %6, label %10, !dbg !36

6:                                                ; preds = %3
  call void @foo(), !dbg !37
  br label %7, !dbg !37

7:                                                ; preds = %6
  %8 = load i32, i32* %2, align 4, !dbg !38
  %9 = add nsw i32 %8, 1, !dbg !38
  store i32 %9, i32* %2, align 4, !dbg !38
  br label %3, !dbg !39, !llvm.loop !40

10:                                               ; preds = %3
  ret i32 0, !dbg !43
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1, !2, !3, !4, !5, !6}
!llvm.dbg.cu = !{!7}
!llvm.ident = !{!9}

!0 = !{i32 2, !"SDK Version", [2 x i32] [i32 12, i32 1]}
!1 = !{i32 7, !"Dwarf Version", i32 4}
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = !{i32 1, !"wchar_size", i32 4}
!4 = !{i32 7, !"PIC Level", i32 2}
!5 = !{i32 7, !"uwtable", i32 1}
!6 = !{i32 7, !"frame-pointer", i32 2}
!7 = distinct !DICompileUnit(language: DW_LANG_C99, file: !8, producer: "clang version 14.0.0 (https://github.com/llvm/llvm-project.git e7298464c5d004a119583cdb8a120dc3d968508d)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None, sysroot: "/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX12.1.sdk", sdk: "MacOSX12.1.sdk")
!8 = !DIFile(filename: "example_for_call_count.c", directory: "/Users/haohua/Documents/GitHub/cs-nano-projects/llvm-hello-world-backend")
!9 = !{!"clang version 14.0.0 (https://github.com/llvm/llvm-project.git e7298464c5d004a119583cdb8a120dc3d968508d)"}
!10 = distinct !DISubprogram(name: "foo", scope: !8, file: !8, line: 12, type: !11, scopeLine: 12, spFlags: DISPFlagDefinition, unit: !7, retainedNodes: !13)
!11 = !DISubroutineType(types: !12)
!12 = !{null}
!13 = !{}
!14 = !DILocation(line: 12, column: 14, scope: !10)
!15 = distinct !DISubprogram(name: "bar", scope: !8, file: !8, line: 13, type: !11, scopeLine: 13, spFlags: DISPFlagDefinition, unit: !7, retainedNodes: !13)
!16 = !DILocation(line: 13, column: 13, scope: !15)
!17 = !DILocation(line: 13, column: 20, scope: !15)
!18 = distinct !DISubprogram(name: "fez", scope: !8, file: !8, line: 14, type: !11, scopeLine: 14, spFlags: DISPFlagDefinition, unit: !7, retainedNodes: !13)
!19 = !DILocation(line: 14, column: 13, scope: !18)
!20 = !DILocation(line: 14, column: 20, scope: !18)
!21 = distinct !DISubprogram(name: "main", scope: !8, file: !8, line: 16, type: !22, scopeLine: 16, spFlags: DISPFlagDefinition, unit: !7, retainedNodes: !13)
!22 = !DISubroutineType(types: !23)
!23 = !{!24}
!24 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!25 = !DILocation(line: 17, column: 3, scope: !21)
!26 = !DILocation(line: 18, column: 3, scope: !21)
!27 = !DILocation(line: 19, column: 3, scope: !21)
!28 = !DILocalVariable(name: "ii", scope: !21, file: !8, line: 21, type: !24)
!29 = !DILocation(line: 21, column: 7, scope: !21)
!30 = !DILocation(line: 22, column: 11, scope: !31)
!31 = distinct !DILexicalBlock(scope: !21, file: !8, line: 22, column: 3)
!32 = !DILocation(line: 22, column: 8, scope: !31)
!33 = !DILocation(line: 22, column: 16, scope: !34)
!34 = distinct !DILexicalBlock(scope: !31, file: !8, line: 22, column: 3)
!35 = !DILocation(line: 22, column: 19, scope: !34)
!36 = !DILocation(line: 22, column: 3, scope: !31)
!37 = !DILocation(line: 23, column: 5, scope: !34)
!38 = !DILocation(line: 22, column: 27, scope: !34)
!39 = !DILocation(line: 22, column: 3, scope: !34)
!40 = distinct !{!40, !36, !41, !42}
!41 = !DILocation(line: 23, column: 9, scope: !31)
!42 = !{!"llvm.loop.mustprogress"}
!43 = !DILocation(line: 25, column: 3, scope: !21)
