#!/bin/bash

clang -emit-llvm -S foo.c -o foo.ll
clang -emit-llvm -S bar.c -o bar.ll

opt -enable-new-pm=0 -S -load /Users/haohua/Documents/GitHub/cs-nano-projects/llvm101/llvm-hello/build/lib/libDynamicCallCounter.dylib  -legacy-dynamic-cc foo.ll -o foo_opt.ll
opt -enable-new-pm=0 -S -load /Users/haohua/Documents/GitHub/cs-nano-projects/llvm101/llvm-hello/build/lib/libDynamicCallCounter.dylib  -legacy-dynamic-cc bar.ll -o bar_opt.ll

llc foo_opt.ll 
llc bar_opt.ll 