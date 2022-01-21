# LLVM Pass Hello World

### 主要参考
[Writing an LLVM Pass — LLVM 13 documentation](https://llvm.org/docs/WritingAnLLVMPass.html)

>This build script specifies that `Hello.cpp` file in the current directory is to be compiled and linked into a shared object `$(LEVEL)/lib/LLVMHello.so` that can be dynamically loaded by the **opt** tool via its [`-load`](https://llvm.org/docs/CommandGuide/opt.html#cmdoption-opt-load) option. If your operating system uses a suffix other than `.so` (such as Windows or macOS), the appropriate extension will be used.

将文件 `Hello.cpp` 编译，并且跟 LLVM 里面的东西链接成一个 shared object `LLVMHello.so` 。
这就是所谓的 Pass 。

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



