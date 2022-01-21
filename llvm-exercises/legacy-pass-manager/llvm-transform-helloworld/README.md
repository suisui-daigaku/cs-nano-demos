# LLVM Pass Hello World

主要参考
[Writing an LLVM Pass — LLVM 13 documentation](https://llvm.org/docs/WritingAnLLVMPass.html)

>This build script specifies that `Hello.cpp` file in the current directory is to be compiled and linked into a shared object `$(LEVEL)/lib/LLVMHello.so` that can be dynamically loaded by the **opt** tool via its [`-load`](https://llvm.org/docs/CommandGuide/opt.html#cmdoption-opt-load) option. If your operating system uses a suffix other than `.so` (such as Windows or macOS), the appropriate extension will be used.

将文件 `Hello.cpp` 编译，并且跟 LLVM 里面的东西链接成一个 shared object `LLVMHello.so` 。
这就是所谓的 Pass 。


