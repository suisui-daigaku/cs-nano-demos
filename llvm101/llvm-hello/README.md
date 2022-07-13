# LLVM Pass 小作业

写小作业是最快的学习方法

This is the tutorial for **LLVM IR Pass** 

The tutorial for **LLVM backend Pass** is at [here](../llvm-hello-world-backend/README.md) 

## Objectives 

- 学会 LLVM IR pass 
- 学会 LLVM Test 
- 学会 Git Submodule 
- 学会 LLVM backend 

## 推荐资料

- [Building, Testing and Debugging a Simple out-of-tree LLVM Pass](https://llvm.org/devmtg/2015-10/slides/GueltonGuinet-BuildingTestingDebuggingASimpleOutOfTreePass.pdf)
- [Getting Started/Tutorials — LLVM 15.0.0git documentation](https://llvm.org/docs/GettingStartedTutorials.html)
- [LLVM Tutorial: Table of Contents](https://llvm.org/docs/tutorial/index.html)
- [LLVM Programmer’s Manual](https://llvm.org/docs/ProgrammersManual.html)
- [Writing an LLVM Pass — LLVM 13 documentation](https://llvm.org/docs/WritingAnLLVMPass.html)
- [banach-space/llvm-tutor: A collection of out-of-tree LLVM passes for teaching and learning (github.com)](https://github.com/banach-space/llvm-tutor)
- [Writing an LLVM Backend — LLVM 15.0.0git documentation](https://llvm.org/docs/WritingAnLLVMBackend.html)

### 安装 LLVM 
![](https://raw.githubusercontent.com/haohua-li/photo-asset-repo/main/imgs/image-20220201155131404.png)


差不多就是这样，看 <https://randoruf.github.io/2022/01/18/llvm-installation.html>

```
mkdir build && cd build

cmake ../llvm -G Ninja -DLT_LLVM_INSTALL_DIR="/usr/local" -DCMAKE_BUILD_TYPE="Debug" -DLLVM_ENABLE_PROJECTS="clang" -DLLVM_INCLUDE_EXAMPLES="OFF" -DLLVM_INCLUDE_TESTS="OFF" -DLLVM_INCLUDE_BENCHMARKS="OFF" -DLLVM_TARGETS_TO_BUILD="X86" 

# build (use all cores in the laptop)
# cmake --build . -j $(nproc)
ninja -j $(nproc)

# install (use cmake to install, since cmake will keep a record of installed files)
# https://gist.github.com/etaf/5f77158f1c45e90abfa3225f19f3c4bb
sudo cmake -P cmake_install.cmake

# uninstall 
sudo xargs rm -rf < install_manifest.txt
```

有时候可能需要制定一些库文件(比如 glibc)

**Environment Variables:** `CC=/usr/local/bin/clang;CXX=/usr/local/bin/clang++;SDKROOT=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX12.1.sdk` 

具体Xcode 的版本号要查，这是 System Libraries. 

## 优化多个模块

[LLVM IR - Advanced course on compilers - Aalto University Wiki](https://wiki.aalto.fi/pages/viewpage.action?pageId=55377710)





## 编译 LLVM Hello

非常类似上面操作, 具体细节看 <https://github.com/banach-space/llvm-tutor#dynamiccallcounter>

```
mkdir build
cmake -DLT_LLVM_INSTALL_DIR=<llvm13> ..
make
```

> 其中 `<llvm13>`的路径需要利用 `llvm-config` 获取。具体看 <https://github.com/UofT-EcoSystem/CSCD70/>

```
cmake -DLT_LLVM_INSTALL_DIR=$(llvm-config --prefix) ..
```

> 期间可能会出现很多不可思议的错误，出现错误后，把 `build` 删除掉，重新 `cmake` 。

然后需要 `opt` 优化器手动加载在 `build` 文件夹的 `.so` 类型文件 (把 `.so` 想象为一个 IR Pass 即可) 。

```
clang -emit-llvm -c ./Examples/example_for_call_count.c -o ./Examples/example_for_call_count.bc
```

```
clang -emit-llvm -S ./Examples/example_for_call_count.c -o ./Examples/example_for_call_count.ll
```

- [Building compiler extension for LLVM 10.0.1 (serge-sans-paille.github.io)](http://serge-sans-paille.github.io/talks/llvmdev2020/output/index.html#/step-1)
- [运行LLVM Pass的两种方式_梦在哪里的博客-CSDN博客_llvm pass](https://blog.csdn.net/qq_23599965/article/details/86620219)
- [初探LLVM&clang&pass - 先知社区 (aliyun.com)](https://xz.aliyun.com/t/7257)
  - (这个 `23R3F` 是个安全大佬，经常分析漏洞和参加安全竞赛)

有两种方式可以运行 pass 

### 使用 Opt 

```
opt -enable-new-pm=0 -S -load ./build/lib/libDynamicCallCounter.dylib -legacy-dynamic-cc ./Examples/example_for_call_count.ll -o ./Examples/example_for_call_count.ll.opt
```

```
opt -enable-new-pm=0 -S -load ./build/lib/libStaticCallCounter.dylib -legacy-static-cc ./Examples/example_for_call_count.ll -o ./Examples/example_for_call_count.ll.opt
```

如果已经注册到标准流中

```
opt -enable-new-pm=0 -S -load ./build/lib/libDynamicCallCounter.dylib ./Examples/example_for_call_count.ll -o ./Examples/example_for_call_count.ll.opt
```

输出 `ll/bc` 文件之后就可以利用 static compiler 直接编译到 Target (或者说是 SubTarget Machine, 这里 SubTarget 的意思是比如 X86 也有很多变种)。

```
lli -jit-kind=mcjit ./Examples/example_for_call_count.ll.opt
```

### 使用 Clang 

如果想要绕过 `opt` ***直接使用 Clang 运行 Pass*** (否则 `global_dtors` 部分会出错，虽然不知道什么原因)，必须将 Pass 注册到标准流中。

(`opt` 只需要注册到 Pass Manager ， 注册到标准流的意思是必须运行这一段)

具体可以参考 

- [Writing an LLVM Pass — LLVM 15.0.0git documentation](https://llvm.org/docs/WritingAnLLVMPass.html#basic-code-required)
- [初探LLVM&clang&pass - 先知社区 (aliyun.com)](https://xz.aliyun.com/t/7257)
- [Building compiler extension for LLVM 10.0.1 (serge-sans-paille.github.io)](http://serge-sans-paille.github.io/talks/llvmdev2020/output/index.html#/step-1)

> **注意:**  必须先注册到 `RegisterStandardPasses` 才执行以下步骤

```
clang -Xclang -load -Xclang ./build/lib/libDynamicCallCounter.dylib ./Examples/example_for_call_count.c -o ./Examples/example_for_call_count
```

```
./Examples/example_for_call_count 
```

## 小作业

[*Get Started with LLVM core Libraries* -  Writing a custom LLVM IR generator](./_LLVMCoreLibrariesBook/write_llvm_ir_generator.md)

[为 New Pass Manager 开发一个 Pass](./_Homeworks/write_an_pass_npm.md) 

