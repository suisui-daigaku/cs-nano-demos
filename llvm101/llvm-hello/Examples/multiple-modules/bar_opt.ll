; ModuleID = 'bar.ll'
source_filename = "bar.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [5 x i8] c"bar\0A\00", align 1
@CounterFor_bar = common global i32 0, align 4
@0 = private unnamed_addr constant [4 x i8] c"bar\00", align 1
@ResultFormatStrIR = global [14 x i8] c"%-20s %-10lu\0A\00"
@ResultHeaderStrIR = global [225 x i8] c"=================================================\0ALLVM-TUTOR: dynamic analysis results\0A=================================================\0ANAME                 #N DIRECT CALLS\0A-------------------------------------------------\0A\00"
@llvm.global_dtors = appending global [1 x { i32, void ()*, i8* }] [{ i32, void ()*, i8* } { i32 0, void ()* @printf_wrapper, i8* null }]

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @bar() #0 {
  %1 = load i32, i32* @CounterFor_bar, align 4
  %2 = add i32 1, %1
  store i32 %2, i32* @CounterFor_bar, align 4
  %3 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i64 0, i64 0))
  ret void
}

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #1

define void @printf_wrapper() {
enter:
  %0 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([225 x i8], [225 x i8]* @ResultHeaderStrIR, i32 0, i32 0))
  %1 = load i32, i32* @CounterFor_bar, align 4
  %2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @ResultFormatStrIR, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @0, i32 0, i32 0), i32 %1)
  ret void
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 2, !"SDK Version", [2 x i32] [i32 12, i32 3]}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 7, !"PIC Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 1}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"Homebrew clang version 13.0.1"}
