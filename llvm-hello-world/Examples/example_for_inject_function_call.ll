; ModuleID = './Examples/example_for_inject_function_call.c'
source_filename = "./Examples/example_for_inject_function_call.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @foo(i32 noundef %a) #0 {
entry:
  %a.addr = alloca i32, align 4
  store i32 %a, i32* %a.addr, align 4
  %0 = load i32, i32* %a.addr, align 4
  %mul = mul nsw i32 %0, 2
  ret i32 %mul
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @bar(i32 noundef %a, i32 noundef %b) #0 {
entry:
  %a.addr = alloca i32, align 4
  %b.addr = alloca i32, align 4
  store i32 %a, i32* %a.addr, align 4
  store i32 %b, i32* %b.addr, align 4
  %0 = load i32, i32* %a.addr, align 4
  %1 = load i32, i32* %b.addr, align 4
  %call = call i32 @foo(i32 noundef %1)
  %mul = mul nsw i32 %call, 2
  %add = add nsw i32 %0, %mul
  ret i32 %add
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @fez(i32 noundef %a, i32 noundef %b, i32 noundef %c) #0 {
entry:
  %a.addr = alloca i32, align 4
  %b.addr = alloca i32, align 4
  %c.addr = alloca i32, align 4
  store i32 %a, i32* %a.addr, align 4
  store i32 %b, i32* %b.addr, align 4
  store i32 %c, i32* %c.addr, align 4
  %0 = load i32, i32* %a.addr, align 4
  %1 = load i32, i32* %a.addr, align 4
  %2 = load i32, i32* %b.addr, align 4
  %call = call i32 @bar(i32 noundef %1, i32 noundef %2)
  %mul = mul nsw i32 %call, 2
  %add = add nsw i32 %0, %mul
  %3 = load i32, i32* %c.addr, align 4
  %mul1 = mul nsw i32 %3, 3
  %add2 = add nsw i32 %add, %mul1
  ret i32 %add2
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %a = alloca i32, align 4
  %ret = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  store i32 123, i32* %a, align 4
  store i32 0, i32* %ret, align 4
  %0 = load i32, i32* %a, align 4
  %call = call i32 @foo(i32 noundef %0)
  %1 = load i32, i32* %ret, align 4
  %add = add nsw i32 %1, %call
  store i32 %add, i32* %ret, align 4
  %2 = load i32, i32* %a, align 4
  %3 = load i32, i32* %ret, align 4
  %call1 = call i32 @bar(i32 noundef %2, i32 noundef %3)
  %4 = load i32, i32* %ret, align 4
  %add2 = add nsw i32 %4, %call1
  store i32 %add2, i32* %ret, align 4
  %5 = load i32, i32* %a, align 4
  %6 = load i32, i32* %ret, align 4
  %call3 = call i32 @fez(i32 noundef %5, i32 noundef %6, i32 noundef 123)
  %7 = load i32, i32* %ret, align 4
  %add4 = add nsw i32 %7, %call3
  store i32 %add4, i32* %ret, align 4
  ret i32 0
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 2, !"SDK Version", [2 x i32] [i32 12, i32 1]}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 7, !"PIC Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 1}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"clang version 14.0.0 (https://github.com/llvm/llvm-project.git e7298464c5d004a119583cdb8a120dc3d968508d)"}
