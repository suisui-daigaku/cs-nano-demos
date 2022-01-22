# LLVM Pass 小作业
写小作业是最快的学习方法。
LLVM Pass 的 Pass 是 “趟/遍" 的意思。因为优化阶段实际上由多个 Pass 顺序构成。
![[Pasted image 20220122122557.png]]
图片来自《Engineering a Compiler》 ，属于 Fair Use 。


## 参考资料
官方文档永远是你的 Primary Source [Writing an LLVM Pass — LLVM 13 documentation](https://llvm.org/docs/WritingAnLLVMPass.html)
大多数中文博客都是抄上去面的，没必要浪费时间去看。
注意 Optimization Pipeline 已经换了 New Pass Manager 
但是 Codegen Pipeline 还是 Legacy Pass Manager 
(Codegen 是啥？编译原理的 Code Generarion 吗)。
New Pass Manager 的写法不一样，要用 `-enable-new-pm=0` 禁用，否则会出错。


### To Do list 
- [ ] https://llvm.org/docs/WritingAnLLVMPass.html
- [ ] https://llvm.org/docs/GettingStarted.html
- [ ] https://llvm.org/doxygen/classllvm_1_1MachineInstrBuilder.html
- [ ] https://www.jianshu.com/p/9f450969121b
- [ ] https://blog.csdn.net/mamamama811/article/details/110165333

- [ ] 写完所有 LLVM Pass 的练习。    
- [ ] **backend pass**
- [ ] 之后了解 IR
- [ ] 每个 Module 都写一下作业。。。。
- [ ] LLVM 如何插入指令(插代码)
- [ ] 比如数据的存储/读取。
- [ ] ***插入指令以后，要观察运行状况 (如何检验 LLVM Pass 真的在 Backend 部分给程序插入了指令....)***
- [ ] LLVM Class 的**模块依赖关系**。