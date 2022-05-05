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

不知道为什么 Homebrew 的安装下来不能运行。
就自己从 Github 下载 source code build, 没想到很多坑。
比如要同时启动 `Clang` 还有一堆 STL 和 Runtime libraries, 还有 Release 和 Debug 等等。

具体可以看 https://haohua-li.github.io/2022/01/18/llvm-installation.html

![](https://raw.githubusercontent.com/haohua-li/photo-asset-repo/main/imgs/image-20220201155131404.png)

```
mkdir build & cd build 
cmake -DLT_LLVM_INSTALL_DIR="/usr/local" ..
make
```

CMake options : `-G "Unix Makefiles"`

Build directory : `build`

Build options: `-- -j 9`

Environment: `CC=/usr/local/bin/clang;CXX=/usr/local/bin/clang++;SDKROOT=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX12.1.sdk` 

具体Xcode 的版本号要查，这是 System Libraries. 

## 小作业

[*Get Started with LLVM core Libraries* -  Writing a custom LLVM IR generator](./_LLVMCoreLibrariesBook/write_llvm_ir_generator.md)

[为 New Pass Manager 开发一个 Pass](./_Homeworks/write_an_pass_npm.md) 

