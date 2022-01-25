# LLVM Pass 小作业

写小作业是最快的学习方法。

## 总结

- [Writing an LLVM Pass — LLVM 13 documentation](https://llvm.org/docs/WritingAnLLVMPass.html)
- [LLVM中的pass及其管理机制_大头蚂蚁的窝-CSDN博客_llvm pass](https://blog.csdn.net/mamamama811/article/details/110165333)
  - 这个写的非常好。
- https://llvm.org/doxygen/classllvm_1_1MachineInstrBuilder.html
- https://www.jianshu.com/p/9f450969121b
- https://llvm.org/docs/GettingStarted.html

## LLVM Tutor 

[banach-space/llvm-tutor: A collection of out-of-tree LLVM passes for teaching and learning (github.com)](https://github.com/banach-space/llvm-tutor)

- Github Repository: 
  - [banach-space/llvm-tutor: A collection of out-of-tree LLVM passes for teaching and learning (github.com)](https://github.com/banach-space/llvm-tutor)
- Slides: 
  - https://llvm.org/devmtg/2019-10/slides/Warzynski-WritingAnLLVMPass.pdf
- Videos: 
  - [2019 LLVM Developers’ Meeting: A. Warzynski “Writing an LLVM Pass: 101” - YouTube](https://www.youtube.com/watch?v=ar7cJl2aBuU)

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

### To Do list

- [ ] 写完所有 LLVM Pass 的练习。    
- [ ] **backend pass**
- [ ] 之后了解 IR
- [ ] 每个 Module 都写一下作业。。。。
- [ ] LLVM 如何插入指令(插代码)
- [ ] 比如数据的存储/读取。
- [ ] ***插入指令以后，要观察运行状况 (如何检验 LLVM Pass 真的在 Backend 部分给程序插入了指令....)***
- [ ] LLVM Class 的**模块依赖关系**。

