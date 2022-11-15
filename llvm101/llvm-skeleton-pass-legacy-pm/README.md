# llvm-pass-skeleton

The orginal author is Adrian Sampson. 

A completely useless LLVM pass.
It's for LLVM 14.

Build:

    $ mkdir build
    $ cd build
    $ cmake ..
    $ make

Run:
    $ clang -flegacy-pass-manager -Xclang -load -Xclang build/lib/libHelloWorldPass.{dylib|so} something.c

For example, 

    $ cd examples 
    $ clang -flegacy-pass-manager -Xclang -load -Xclang ../build/lib/libHelloWorldPass.so for_bar.c 