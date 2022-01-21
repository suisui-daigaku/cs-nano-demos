# LLVM 小作业
写小作业是最快的学习方法。

## 参考资料

官方文档永远是你的 Primary Source [Writing an LLVM Pass — LLVM 13 documentation](https://llvm.org/docs/WritingAnLLVMPass.html)

大多数中文博客都是抄上去面的，没必要浪费时间去看。

注意 Optimization Pipeline 已经换了 New Pass Manager 

但是 Codegen Pipeline 还是 Legacy Pass Manager 

(Codegen 是啥？编译原理的 Code Generarion 吗)。

New Pass Manager 的写法不一样，要用 `-enable-new-pm=0` 禁用，否则会出错。



