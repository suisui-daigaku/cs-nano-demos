# LLVM Pass 小作业

写小作业是最快的学习方法。

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





 ## 其他

大佬们

- [Lele's Memo: The LLVM Target Independent Code Generator (cnlelema.github.io)](https://cnlelema.github.io/memo/en/codegen/) LLVM 笔记
- [Enna1 (Enna1) (github.com)](https://github.com/Enna1) 在字节工作的大佬，主攻编译原理，他最主要学习方法就是**看 LLVM 源码**。
- [Andrzej Warzyński](https://github.com/banach-space) 在 ARM 工作的大佬。

其他参考资料

- [Radhika Ghosal | Writing a MachineFunctionPass in LLVM (kharghoshal.xyz)](https://www.kharghoshal.xyz/blog/writing-machinefunctionpass)
- [Writing an LLVM Backend — LLVM 15.0.0git documentation](https://llvm.org/docs/WritingAnLLVMBackend.html)
- [Tutorial: Creating an LLVM Backend for the Cpu0 Architecture (jonathan2251.github.io)](http://jonathan2251.github.io/lbd/TutorialLLVMBackendCpu0.pdf)
- [How to Write an LLVM Backend #0: Introduction | Source Code Artisan](https://sourcecodeartisan.com/2020/09/13/llvm-backend-0.html)
- LLVM [LLVM Resources – MPS Lab (asu.edu)](https://labs.engineering.asu.edu/mps-lab/resources/llvm-resources/) 

- [LLVM Writing a Backend Pass – MPS Lab (asu.edu)](https://labs.engineering.asu.edu/mps-lab/resources/llvm-resources/llvm-writing-a-backend-pass/)

- [Linux Tutorial - Static, Shared Dynamic and Loadable Linux Libraries (yolinux.com)](http://www.yolinux.com/TUTORIALS/LibraryArchives-StaticAndDynamic.html)
- [Dynamic vs Static Plugins](https://github.com/banach-space/llvm-tutor#dynamic-vs-static-plugins)
- Pass执行顺序 <https://llvm.org/docs/WritingAnLLVMPass.html#basic-code-required>
- 加入到系统的 Pipeline (不推荐) <https://github.com/banach-space/llvm-tutor#auto-registration-with-optimisation-pipelines>
- `-O0` 可能会遇到的禁用Pass的问题 <https://github.com/banach-space/llvm-tutor#overview-of-the-passes>
- [Writing an LLVM Pass — LLVM 13 documentation](https://llvm.org/docs/WritingAnLLVMPass.html)
- LLVM-tutor 教程 <https://github.com/banach-space/llvm-tutor>
  - [LLVM tutor 的扩展资料](https://github.com/banach-space/llvm-tutor#references)
- [LLVM中的pass及其管理机制_大头蚂蚁的窝-CSDN博客_llvm pass](https://blog.csdn.net/mamamama811/article/details/110165333)
- [Writing an LLVM Backend — LLVM 13 documentation](https://llvm.org/docs/WritingAnLLVMBackend.html)
- [2019 LLVM Developers’ Meeting: A. Warzynski “Writing an LLVM Pass: 101” - YouTube](https://www.youtube.com/watch?v=ar7cJl2aBuU)
- [Free Compiler Camp](https://freecompilercamp.org/#Class)
  - LLVM 小作业
- [LLVM Tutorial: Table of Contents — LLVM 15.0.0git documentation](https://llvm.org/docs/tutorial/index.html)
  - LLVM 官方的辅导例子 (讲述了如何发明一门编程语言)
- [User Guides — LLVM 13 documentation](https://llvm.org/docs/UserGuides.html)
  - 主要介绍了 Optimization 和 Code Generation 。
- [LLVM Programmer’s Manual — LLVM 15.0.0git documentation](https://llvm.org/docs/ProgrammersManual.html)
  - 从入门到入坟都需要捧着的参考手册 (programming manual) 

- [PacktPublishing/Learn-LLVM-12: Learn LLVM 12, published by Packt (github.com)](https://github.com/PacktPublishing/Learn-LLVM-12)
- [quarkslab/llvm-passes: Collection of various llvm passes (github.com)](https://github.com/quarkslab/llvm-passes)
- [Home Page of Toby Ho](https://tobyho.com/)
  - [LLVM Tutorial #1: Introduction - YouTube](https://www.youtube.com/watch?v=DWHDjVI5juo)
- [CSCD70 Compiler Optimization — CSCD70 2021S documentation (uoft-ecosystem.github.io)](https://uoft-ecosystem.github.io/CSCD70/)
- https://llvm.org/doxygen/classllvm_1_1MachineInstrBuilder.html
- <https://github.com/banach-space/llvm-tutor>
- LLVM IR opcode:  [llvm-project/Instruction.cpp at release/13.x · llvm/llvm-project (github.com)](https://github.com/llvm/llvm-project/blob/release/13.x/llvm/lib/IR/Instruction.cpp#L338-L417)

---

### To Do list

- [ ] Machine Instruction Builder 
- [ ] CFG
- [ ] 下次meeting，用一个简单的例子**展示一下IR pass和 backend pass的写法**。就展示给我看一下**流程**就可以 
  - [ ] IR Pass 
  - [ ] backend pass 

- [ ] SGX small program  
- [ ] 将 ***LLVM-tutor*** 所有例子全部实现一次 https://github.com/banach-space/llvm-tutor#helloworld-your-first-pass 。每个 Module 的 Legacy 都写一下作业。。。。
  - [x] HelloWorld - Analysis 
  - [x] OpcodeCounter - Analysis 
  - [x] InjectFuncCall - Transformation (如果插入函数，每次运行程序都会 HelloWorld) 
  - [x] StaticCallCounter - Analysis (编译的时候计数)
  - [ ] DynamicCallCounter - Tranformation (插入计数函数)
  - [ ] MBASub - Transformation 
  - [ ] MBAdd - Transformation 
  - [ ] FindFCmpEq - Analysis 
  - [ ] ConvertCmpEq - Transformation 
  - [ ] RIV - Analysis 
  - [ ] DuplicateBB - CFG 
  - [ ] MergeBB - CFG 
- [ ] **backend pass**
  - [ ] LLVM 如何插入指令(插代码)
  - [ ] 之后了解 IR
  - [ ] 比如数据的存储/读取。
  - [ ] ***插入指令以后，要观察运行状况 (如何检验 LLVM Pass 真的在 Backend 部分给程序插入了指令....)***
- [ ] LLVM Class 的**模块依赖关系**。
