# LLVM Pass Hello World

### 主要参考
[Writing an LLVM Pass — LLVM 13 documentation](https://llvm.org/docs/WritingAnLLVMPass.html)

>This build script specifies that `Hello.cpp` file in the current directory is to be compiled and linked into a shared object `$(LEVEL)/lib/LLVMHello.so` that can be dynamically loaded by the **opt** tool via its [`-load`](https://llvm.org/docs/CommandGuide/opt.html#cmdoption-opt-load) option. If your operating system uses a suffix other than `.so` (such as Windows or macOS), the appropriate extension will be used.

将文件 `Hello.cpp` 编译，并且跟 LLVM 里面的东西链接成一个 shared object `LLVMHello.so` 。
这就是所谓的 Pass 。

### 疑问
目前 CMake 还不能用，编译会出错，不知道为什么。

### 注册 Pass 
注册到 `RegisterPass` 之后就可以用 `opt` 指令来运行啦！


### 编译和链接 LLVM Pass 
直接去 `make`
```
make
```

### 编译 ByteCode 
```
clang++ -emit-llvm ./test/main.cpp -o ./test/main.bc
```
原函数故意只写了一个，否则 LLVM Pass 会运行很多次。


### 使用 LLVM Pass 分析
因为这个 LLVM 什么都不做，仅仅只是在屏幕输出 Hello World 
```bash
opt -load Hello.so -hello ./test/main.bc -o ./test/mainOpt.bc -enable-new-pm=0
```
记得禁用 `enable-new-pm=0`  ，教程在一开始就说 Legacy LLVM Pass Manager.... 

如果被处理过的 ByteCode 不太重要，可以丢弃给 `/dev/null`
```bash
opt -load Hello.so -hello <hello.bc> -o /dev/null -enable-new-pm=0 
```
其中 `<>` 符号是 BNF 语法中常见内容，里面填入文件名即可。

把 `Hello.so` 作为 **shared object** 被加载，然后加载以后，你可以看到你的 Pass 已经加入到可选的项中 (叫作 register )
```bash
opt -load lib/LLVMHello.so -help
```
可以得到优化选项
```
OVERVIEW: llvm .bc -> .bc modular optimizer and analysis printer

USAGE: opt [subcommand] [options] <input bitcode file>

OPTIONS:
 Optimizations available:
...
 -guard-widening           - Widen guards
 -gvn                      - Global Value Numbering
 -gvn-hoist                - Early GVN Hoisting of Expressions
 -hello                    - Hello World Pass
 -indvars                  - Induction Variable Simplification
 -inferattrs               - Infer set function attributes
...
```


### Pass 运行时间
可以查看 Pass 运行了多久。
```bash
opt -load Hello.so -hello ./test/main.bc -o /dev/null -enable-new-pm=0 -time-passes
```
其中 Module Verifer 是保证在你的 Pass 之后，程序不会崩溃 ? (不清楚)
```
===-------------------------------------------------------------------------===
                      ... Pass execution timing report ...
===-------------------------------------------------------------------------===
  Total Execution Time: 0.0002 seconds (0.0003 wall clock)

   ---User Time---   --System Time--   --User+System--   ---Wall Time---  ---Instr---  --- Name ---
   0.0002 ( 91.5%)   0.0001 ( 86.3%)   0.0002 ( 90.0%)   0.0002 ( 89.6%)     707635  Bitcode Writer
   0.0000 (  7.4%)   0.0000 (  4.1%)   0.0000 (  6.4%)   0.0000 (  6.5%)      87150  Module Verifier
   0.0000 (  1.1%)   0.0000 (  9.6%)   0.0000 (  3.6%)   0.0000 (  4.0%)      51135  Hello World Pass
   0.0002 (100.0%)   0.0001 (100.0%)   0.0002 (100.0%)   0.0003 (100.0%)     845920  Total

===-------------------------------------------------------------------------===
                                LLVM IR Parsing
===-------------------------------------------------------------------------===
  Total Execution Time: 0.0004 seconds (0.0004 wall clock)

   ---User Time---   --System Time--   --User+System--   ---Wall Time---  ---Instr---  --- Name ---
   0.0003 (100.0%)   0.0001 (100.0%)   0.0004 (100.0%)   0.0004 (100.0%)    1151829  Parse IR
   0.0003 (100.0%)   0.0001 (100.0%)   0.0004 (100.0%)   0.0004 (100.0%)    1151829  Total
```

### 查看优化结果
由于 Pass 处理过的输出是 ByteCode， 根本看不懂。
- (1) 可以把 ByteCode 进行翻译到 IR 
- (2) 使用 `-print-after-all` 打印出 IR 的变化 (推荐，因为不用全部对比)
```
Hello: *** IR Dump After Hello World Pass (hello) ***
; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @_Z3addv() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1, align 4
  ret i32 0
}

*** IR Dump After Module Verifier (verify) ***
; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @_Z3addv() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1, align 4
  ret i32 0
}
```

