; ModuleID = '../test/Fibonacci.c'
source_filename = "../test/Fibonacci.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

%struct.__sFILE = type { i8*, i32, i32, i16, i16, %struct.__sbuf, i32, i8*, i32 (i8*)*, i32 (i8*, i8*, i32)*, i64 (i8*, i64, i32)*, i32 (i8*, i8*, i32)*, %struct.__sbuf, %struct.__sFILEX*, i32, [3 x i8], [1 x i8], %struct.__sbuf, i32, i64 }
%struct.__sFILEX = type opaque
%struct.__sbuf = type { i8*, i32 }
%struct.__va_list_tag = type { i32, i32, i8*, i8* }

@__stdoutp = external local_unnamed_addr global %struct.__sFILE*, align 8
@.str = private unnamed_addr constant [9 x i8] c"f(0) = 0\00", align 1
@.str.1 = private unnamed_addr constant [9 x i8] c"f(1) = 1\00", align 1
@.str.2 = private unnamed_addr constant [22 x i8] c"f(%d) = f(%d) + f(%d)\00", align 1

; Function Attrs: nounwind ssp uwtable
define i32 @printf(i8* noundef %0, ...) local_unnamed_addr #0 {
  %2 = alloca [1 x %struct.__va_list_tag], align 16
  %3 = bitcast [1 x %struct.__va_list_tag]* %2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 24, i8* nonnull %3) #4
  %4 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %2, i64 0, i64 0
  call void (%struct.__va_list_tag*, ...) @va_start(%struct.__va_list_tag* noundef nonnull %4, i8* noundef %0) #4
  %5 = load %struct.__sFILE*, %struct.__sFILE** @__stdoutp, align 8, !tbaa !6
  %6 = call i32 @vfprintf(%struct.__sFILE* noundef %5, i8* noundef %0, %struct.__va_list_tag* noundef nonnull %4)
  call void @va_end(%struct.__va_list_tag* noundef nonnull %4) #4
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %3) #4
  ret i32 %6
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: nounwind
declare void @va_start(%struct.__va_list_tag* noundef, ...) local_unnamed_addr #2

; Function Attrs: nofree nounwind
declare noundef i32 @vfprintf(%struct.__sFILE* nocapture noundef, i8* nocapture noundef readonly, %struct.__va_list_tag* noundef) local_unnamed_addr #3

; Function Attrs: nounwind
declare void @va_end(%struct.__va_list_tag* noundef) local_unnamed_addr #2

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: nounwind ssp uwtable
define i32 @Fibonacci(i32 noundef %0) local_unnamed_addr #0 {
  %2 = alloca [1 x %struct.__va_list_tag], align 16
  %3 = alloca [1 x %struct.__va_list_tag], align 16
  %4 = alloca [1 x %struct.__va_list_tag], align 16
  switch i32 %0, label %15 [
    i32 0, label %5
    i32 1, label %10
  ]

5:                                                ; preds = %1
  %6 = bitcast [1 x %struct.__va_list_tag]* %4 to i8*
  call void @llvm.lifetime.start.p0i8(i64 24, i8* nonnull %6) #4
  %7 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %4, i64 0, i64 0
  call void (%struct.__va_list_tag*, ...) @va_start(%struct.__va_list_tag* noundef nonnull %7, i8* noundef getelementptr inbounds ([9 x i8], [9 x i8]* @.str, i64 0, i64 0)) #4
  %8 = load %struct.__sFILE*, %struct.__sFILE** @__stdoutp, align 8, !tbaa !6
  %9 = call i32 @vfprintf(%struct.__sFILE* noundef %8, i8* noundef getelementptr inbounds ([9 x i8], [9 x i8]* @.str, i64 0, i64 0), %struct.__va_list_tag* noundef nonnull %7) #4
  call void @va_end(%struct.__va_list_tag* noundef nonnull %7) #4
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %6) #4
  br label %25

10:                                               ; preds = %1
  %11 = bitcast [1 x %struct.__va_list_tag]* %3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 24, i8* nonnull %11) #4
  %12 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %3, i64 0, i64 0
  call void (%struct.__va_list_tag*, ...) @va_start(%struct.__va_list_tag* noundef nonnull %12, i8* noundef getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i64 0, i64 0)) #4
  %13 = load %struct.__sFILE*, %struct.__sFILE** @__stdoutp, align 8, !tbaa !6
  %14 = call i32 @vfprintf(%struct.__sFILE* noundef %13, i8* noundef getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i64 0, i64 0), %struct.__va_list_tag* noundef nonnull %12) #4
  call void @va_end(%struct.__va_list_tag* noundef nonnull %12) #4
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %11) #4
  br label %25

15:                                               ; preds = %1
  %16 = add nsw i32 %0, -1
  %17 = add nsw i32 %0, -2
  %18 = bitcast [1 x %struct.__va_list_tag]* %2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 24, i8* nonnull %18) #4
  %19 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %2, i64 0, i64 0
  call void (%struct.__va_list_tag*, ...) @va_start(%struct.__va_list_tag* noundef nonnull %19, i8* noundef getelementptr inbounds ([22 x i8], [22 x i8]* @.str.2, i64 0, i64 0)) #4
  %20 = load %struct.__sFILE*, %struct.__sFILE** @__stdoutp, align 8, !tbaa !6
  %21 = call i32 @vfprintf(%struct.__sFILE* noundef %20, i8* noundef getelementptr inbounds ([22 x i8], [22 x i8]* @.str.2, i64 0, i64 0), %struct.__va_list_tag* noundef nonnull %19) #4
  call void @va_end(%struct.__va_list_tag* noundef nonnull %19) #4
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %18) #4
  %22 = call i32 @Fibonacci(i32 noundef %16)
  %23 = call i32 @Fibonacci(i32 noundef %17)
  %24 = add nsw i32 %23, %22
  br label %25

25:                                               ; preds = %15, %10, %5
  %26 = phi i32 [ 0, %5 ], [ 1, %10 ], [ %24, %15 ]
  ret i32 %26
}

attributes #0 = { nounwind ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { nofree nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 2, !"SDK Version", [2 x i32] [i32 12, i32 1]}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 7, !"PIC Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 1}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"clang version 14.0.0 (https://github.com/llvm/llvm-project.git e7298464c5d004a119583cdb8a120dc3d968508d)"}
!6 = !{!7, !7, i64 0}
!7 = !{!"any pointer", !8, i64 0}
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C/C++ TBAA"}
