; ModuleID = 'sum.bc'
source_filename = "sum.ll"
target triple = "x86_64-apple-macosx12.0.0"

define private i32 @sum(i32 %a, i32 %b) {
entry:
  %add = add i32 %a, %b
  ret i32 %add
}
