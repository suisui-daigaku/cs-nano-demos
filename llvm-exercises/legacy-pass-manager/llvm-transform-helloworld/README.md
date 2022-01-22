# LLVM Pass Hello World

### 主要参考
[Writing an LLVM Pass — LLVM 13 documentation](https://llvm.org/docs/WritingAnLLVMPass.html)

>This build script specifies that `Hello.cpp` file in the current directory is to be compiled and linked into a shared object `$(LEVEL)/lib/LLVMHello.so` that can be dynamically loaded by the **opt** tool via its [`-load`](https://llvm.org/docs/CommandGuide/opt.html#cmdoption-opt-load) option. If your operating system uses a suffix other than `.so` (such as Windows or macOS), the appropriate extension will be used.

将文件 `Hello.cpp` 编译，并且跟 LLVM 里面的东西链接成一个 shared object `LLVMHello.so` 。
这就是所谓的 Pass 。


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
```
opt -load Hello.so -hello ./test/main.bc -o ./test/mainOpt.bc -enable-new-pm=0
```
记得禁用 `enable-new-pm=0`  
教程在一开始就说 Legacy LLVM Pass Manager.... 

目前 CMake 还不能用，编译会出错，不知道为什么。

把 `Hello.so` 作为 **shared object** 被加载，然后加载以后，你可以看到你的 Pass 已经加入到可选的项中 (叫作 register )
```bash
opt -load lib/LLVMHello.so -help
```

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
可以查看 Pass 运行了多久。其中 `<...>` 是常见的 
```bash
opt -load lib/LLVMHello.so -hello -time-passes < hello.bc > /dev/null
```
```
Hello: __main
Hello: puts
Hello: main
===-------------------------------------------------------------------------===
 ... Pass execution timing report ...
===-------------------------------------------------------------------------===
 Total Execution Time: 0.0007 seconds (0.0005 wall clock)

 ---User Time---   --User+System--   ---Wall Time---  --- Name ---
 0.0004 ( 55.3%)   0.0004 ( 55.3%)   0.0004 ( 75.7%)  Bitcode Writer
 0.0003 ( 44.7%)   0.0003 ( 44.7%)   0.0001 ( 13.6%)  Hello World Pass
 0.0000 (  0.0%)   0.0000 (  0.0%)   0.0001 ( 10.7%)  Module Verifier
 0.0007 (100.0%)   0.0007 (100.0%)   0.0005 (100.0%)  Total
```

