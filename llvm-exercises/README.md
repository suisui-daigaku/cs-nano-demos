# LLVM Pass 小作业
写小作业是最快的学习方法。

## 总结
- [Writing an LLVM Pass — LLVM 13 documentation](https://llvm.org/docs/WritingAnLLVMPass.html)
- [LLVM中的pass及其管理机制_大头蚂蚁的窝-CSDN博客_llvm pass](https://blog.csdn.net/mamamama811/article/details/110165333)
	- 这个写的非常好。
- https://llvm.org/doxygen/classllvm_1_1MachineInstrBuilder.html
- https://www.jianshu.com/p/9f450969121b
- https://llvm.org/docs/GettingStarted.html


## LVM Tutor 
在 LLVM Meeting 的辅导，非常好
- [banach-space/llvm-tutor: A collection of out-of-tree LLVM passes for teaching and learning (github.com)](https://github.com/banach-space/llvm-tutor)
- [Writing an LLVM Pass: 101 - LLVM 2019 tutorial](https://llvm.org/devmtg/2019-10/slides/Warzynski-WritingAnLLVMPass.pdf)
![[Pasted image 20220124224736.png]]



## 什么是 Pass 
LLVM Pass 的 Pass 是 “趟/遍" 的意思。因为优化阶段实际上由多个 Pass 顺序构成。
![[Pasted image 20220122122557.png]]
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