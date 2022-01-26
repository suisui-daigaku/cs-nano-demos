# LLVM Pass 小作业

写小作业是最快的学习方法。

- build ***out-of-tree*** : as known as ***standalone*** , builds against a binary LLVM installation (no need to modify the LLVM source code directly)
  - more flexible, no need to synchronize with LLVM 
  - more clear, as only important changes would be kept (though GitHub can show the differences in the fork).  
  - faster, can run in the new devices without re-building from source code. 
- CMake building system  
  - including the CMake build scripts, test cases (Python testing???). 

## To Do list

- [ ] 将 ***LLVM-tutor*** 所有例子全部实现一次 https://github.com/banach-space/llvm-tutor#helloworld-your-first-pass
- [ ] 写完所有 LLVM Pass 的练习。    
- [ ] **backend pass**
- [ ] 之后了解 IR
- [ ] 每个 Module 都写一下作业。。。。
- [ ] LLVM 如何插入指令(插代码)
- [ ] 比如数据的存储/读取。
- [ ] ***插入指令以后，要观察运行状况 (如何检验 LLVM Pass 真的在 Backend 部分给程序插入了指令....)***
- [ ] LLVM Class 的**模块依赖关系**。

## 总结

- [Writing an LLVM Pass — LLVM 13 documentation](https://llvm.org/docs/WritingAnLLVMPass.html)

- [LLVM中的pass及其管理机制_大头蚂蚁的窝-CSDN博客_llvm pass](https://blog.csdn.net/mamamama811/article/details/110165333)
  - 这个写的非常好。
  
- https://llvm.org/doxygen/classllvm_1_1MachineInstrBuilder.html

- https://www.jianshu.com/p/9f450969121b

- https://llvm.org/docs/GettingStarted.html

- ARM 编译器工程师写的教程。

  - https://twitter.com/_banach_space/status/1194896049615384577?s=20
  - https://github.com/banach-space/llvm-tutor

  - Slides: https://llvm.org/devmtg/2019-10/slides/Warzynski-WritingAnLLVMPass.pdf
  - Videos: [2019 LLVM Developers’ Meeting: A. Warzynski “Writing an LLVM Pass: 101” - YouTube](https://www.youtube.com/watch?v=ar7cJl2aBuU)

其他比较有用的资源: 

- [Writing an LLVM Backend — LLVM 13 documentation](https://llvm.org/docs/WritingAnLLVMBackend.html)
- [abenkhadra/llvm-pass-tutorial: A step-by-step tutorial for building an LLVM sample pass (github.com)](https://github.com/abenkhadra/llvm-pass-tutorial)
- [haohua-li/CSCD70: CSCD70 Compiler Optimization (github.com)](https://github.com/haohua-li/CSCD70)
- [Home Page of Toby Ho](https://tobyho.com/)
- [LLVM Tutorial #1: Introduction - YouTube](https://www.youtube.com/watch?v=DWHDjVI5juo)
- [quarkslab/llvm-passes: Collection of various llvm passes (github.com)](https://github.com/quarkslab/llvm-passes)
- [Make sure we include our SGX pass in opt tool · jakobbotsch/llvm-sgx@cd9c75f (github.com)](https://github.com/jakobbotsch/llvm-sgx/commit/cd9c75f2356f7c459fb2e7fdd5bf9c4235012f6b)
- [ikos/CMakeLists.txt at master · NASA-SW-VnV/ikos (github.com)](https://github.com/NASA-SW-VnV/ikos/blob/master/CMakeLists.txt)
- [PacktPublishing/Learn-LLVM-12: Learn LLVM 12, published by Packt (github.com)](https://github.com/PacktPublishing/Learn-LLVM-12)

## 什么是 Pass 

LLVM Pass 的 Pass 是 “趟/遍" 的意思。因为优化阶段实际上由多个 Pass 顺序构成。
图片来自《Engineering a Compiler》 ，属于 Fair Use 。

## 如何配置 VS Code 

按照 LLVM 的官方教程安装好 LLVM 之后，install 会把 `build` 文件夹里面的二进制文件，header files 全部复制到 **目标目录**，默认是 `/usr/local/` 。如果 VS Code 发神经找不到 `<llvm>` 的文件，就去 `includePath` 把 `/usr/local` 加进去。

## 写个 Hello World 

- LLVM 官方教程: [Writing an LLVM Pass — LLVM 13 documentation](https://llvm.org/docs/WritingAnLLVMPass.html)
- 基于官方教程的笔记 [LLVM安装 (haohua-li.github.io)](https://haohua-li.github.io/2022/01/18/llvm-installation.html)
- LLVM tutor 的教程 https://github.com/banach-space/llvm-tutor#helloworld-your-first-pass



