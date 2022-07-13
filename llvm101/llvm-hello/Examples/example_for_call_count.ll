; ModuleID = './Examples/example_for_call_count.c'
source_filename = "./Examples/example_for_call_count.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @foo() #0 {
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @bar() #0 {
  call void @foo()
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @fez() #0 {
  call void @bar()
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca void (...)*, align 8
  %3 = alloca i32, align 4
  store i32 0, i32* %1, align 4
  call void @foo()
  call void @bar()
  call void @fez()
  store void (...)* bitcast (void ()* @foo to void (...)*), void (...)** %2, align 8
  %4 = load void (...)*, void (...)** %2, align 8
  call void (...) %4()
  store i32 0, i32* %3, align 4
  store i32 0, i32* %3, align 4
  br label %5

5:                                                ; preds = %9, %0
  %6 = load i32, i32* %3, align 4
  %7 = icmp slt i32 %6, 10
  br i1 %7, label %8, label %12

8:                                                ; preds = %5
  call void @foo()
  br label %9

9:                                                ; preds = %8
  %10 = load i32, i32* %3, align 4
  %11 = add nsw i32 %10, 1
  store i32 %11, i32* %3, align 4
  br label %5, !llvm.loop !6

12:                                               ; preds = %5
  ret i32 0
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 2, !"SDK Version", [2 x i32] [i32 12, i32 3]}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 7, !"PIC Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 1}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"Homebrew clang version 13.0.1"}
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.mustprogress"}
