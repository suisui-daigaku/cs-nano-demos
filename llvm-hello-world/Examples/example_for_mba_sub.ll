; ModuleID = '../Examples/example_for_mba_sub.cpp'
source_filename = "../Examples/example_for_mba_sub.cpp"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [19 x i8] c"e = %d and f = %d\0A\00", align 1

; Function Attrs: mustprogress noinline norecurse optnone ssp uwtable
define noundef i32 @main(i32 noundef %argc, i8** noundef %argv) #0 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %c = alloca i32, align 4
  %d = alloca i32, align 4
  %e = alloca i32, align 4
  %f = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  %0 = load i8**, i8*** %argv.addr, align 8
  %arrayidx = getelementptr inbounds i8*, i8** %0, i64 1
  %1 = load i8*, i8** %arrayidx, align 8
  %call = call i32 @atoi(i8* noundef %1)
  store i32 %call, i32* %a, align 4
  %2 = load i8**, i8*** %argv.addr, align 8
  %arrayidx1 = getelementptr inbounds i8*, i8** %2, i64 2
  %3 = load i8*, i8** %arrayidx1, align 8
  %call2 = call i32 @atoi(i8* noundef %3)
  store i32 %call2, i32* %b, align 4
  %4 = load i8**, i8*** %argv.addr, align 8
  %arrayidx3 = getelementptr inbounds i8*, i8** %4, i64 3
  %5 = load i8*, i8** %arrayidx3, align 8
  %call4 = call i32 @atoi(i8* noundef %5)
  store i32 %call4, i32* %c, align 4
  %6 = load i8**, i8*** %argv.addr, align 8
  %arrayidx5 = getelementptr inbounds i8*, i8** %6, i64 4
  %7 = load i8*, i8** %arrayidx5, align 8
  %call6 = call i32 @atoi(i8* noundef %7)
  store i32 %call6, i32* %d, align 4
  %8 = load i32, i32* %a, align 4
  %9 = load i32, i32* %b, align 4
  %sub = sub nsw i32 %8, %9
  store i32 %sub, i32* %e, align 4
  %10 = load i32, i32* %c, align 4
  %11 = load i32, i32* %d, align 4
  %sub7 = sub nsw i32 %10, %11
  store i32 %sub7, i32* %f, align 4
  %12 = load i32, i32* %e, align 4
  %13 = load i32, i32* %f, align 4
  %call8 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([19 x i8], [19 x i8]* @.str, i64 0, i64 0), i32 noundef %12, i32 noundef %13)
  ret i32 0
}

declare i32 @atoi(i8* noundef) #1

declare i32 @printf(i8* noundef, ...) #1

attributes #0 = { mustprogress noinline norecurse optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 2, !"SDK Version", [2 x i32] [i32 12, i32 1]}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 7, !"PIC Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 1}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"clang version 14.0.0 (https://github.com/llvm/llvm-project.git e7298464c5d004a119583cdb8a120dc3d968508d)"}
