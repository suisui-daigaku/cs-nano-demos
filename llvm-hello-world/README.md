# LLVM Pass 小作业

写小作业是最快的学习方法。

## 疑问
- 看看 InjectFuncCall 里面一堆不会，为什么指针类型创建到类型的指针，String 的只要指针的话，原来的对象在哪里。。。。LLVM 的 doc 也太简洁了。。。
- 为什么 LLVM 不能统计 indirect call 的次数 ? (这里 indirect call 指 function pointer, 去看看 `getCalledFunction` 源码研究一下，就像以前学 ***OMPL*** 的时候，去看源码)

### 如何运行
```
mkdir build & cd build 
cmake -DLT_LLVM_INSTALL_DIR="/usr/local" ..
make
```

### 安装 LLVM 
不知道为什么 Homebrew 的安装下来不能运行。
就自己从 Github 下载 source code build, 没想到很多坑。
比如要同时启动 `Clang` 还有一堆 STL 和 Runtime libraries, 还有 Release 和 Debug 等等。

具体可以看 https://haohua-li.github.io/2022/01/18/llvm-installation.html

![](https://raw.githubusercontent.com/haohua-li/photo-asset-repo/main/imgs/image-20220201155131404.png)


### CMake Build  

<img src="https://raw.githubusercontent.com/haohua-li/photo-asset-repo/main/imgs/image-20220204202339822.png" alt="image-20220204202339822" style="zoom: 50%;" /> 

还可以在 Environment 处加上`SDKROOT` 

`SDKROOT=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX12.1.sdk`

具体Xcode 的版本号要查，这是 System Libraries. 

## 预备知识
- [Linux Tutorial - Static, Shared Dynamic and Loadable Linux Libraries (yolinux.com)](http://www.yolinux.com/TUTORIALS/LibraryArchives-StaticAndDynamic.html)
- [Dynamic vs Static Plugins](https://github.com/banach-space/llvm-tutor#dynamic-vs-static-plugins)
- Pass执行顺序 <https://llvm.org/docs/WritingAnLLVMPass.html#basic-code-required>
- 加入到系统的 Pipeline (不推荐) <https://github.com/banach-space/llvm-tutor#auto-registration-with-optimisation-pipelines>
- `-O0` 可能会遇到的禁用Pass的问题 <https://github.com/banach-space/llvm-tutor#overview-of-the-passes>
- [Writing an LLVM Pass — LLVM 13 documentation](https://llvm.org/docs/WritingAnLLVMPass.html)
- LLVM-tutor 教程 <https://github.com/banach-space/llvm-tutor>
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

## 小作业

1. [《Get Started with LLVM core Libraries》 -  *Writing a custom LLVM IR generator*](./docs/write_llvm_ir_generator.md)
2. 



### To Do list

- [ ] Machine Instruction Builder 
- [ ] CFG
- [ ] 下次meeting，用一个简单的例子**展示一下IR pass和 backend pass的写法**
  - [ ] 就展示给我看一下**流程**就可以 

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
- [ ] LLVM New Pass Manager
  - [ ] HelloWorld - Analysis 
  - [ ] OpcodeCounter - Analysis 
  - [ ] InjectFuncCall 
  - [ ] StaticCallCounter 
  - [ ] DynamicCallCounter 
  - [ ] MBASub
  - [ ] MBAdd 
  - [ ] FindFCmpEq
  - [ ] ConvertCmpEq
  - [ ] RIV
  - [ ] DuplicateBB
  - [ ] MergeBB  
- [ ] **backend pass**
  - [ ] LLVM 如何插入指令(插代码)
  - [ ] 之后了解 IR
  - [ ] 比如数据的存储/读取。
  - [ ] ***插入指令以后，要观察运行状况 (如何检验 LLVM Pass 真的在 Backend 部分给程序插入了指令....)***
- [ ] LLVM Class 的**模块依赖关系**。

 ## LLVM 学习资料

官方的用户手册永远都是最好的参考资料。
### 大佬们

- [Enna1 (Enna1) (github.com)](https://github.com/Enna1) 在字节工作的大佬，主攻编译原理，他最主要学习方法就是**看 LLVM 源码**。
- [Andrzej Warzyński](https://github.com/banach-space) 在 ARM 工作的大佬。

### 更多资料

教程末尾的参考资料，非常有用。
Below is a list of LLVM resources available outside the official online documentation that I have found very helpful. Where possible, the items are sorted by date.

- [PacktPublishing/Learn-LLVM-12: Learn LLVM 12, published by Packt (github.com)](https://github.com/PacktPublishing/Learn-LLVM-12)
- [quarkslab/llvm-passes: Collection of various llvm passes (github.com)](https://github.com/quarkslab/llvm-passes)
- [Home Page of Toby Ho](https://tobyho.com/)
  - [LLVM Tutorial #1: Introduction - YouTube](https://www.youtube.com/watch?v=DWHDjVI5juo)
- [CSCD70 Compiler Optimization — CSCD70 2021S documentation (uoft-ecosystem.github.io)](https://uoft-ecosystem.github.io/CSCD70/)
- https://llvm.org/doxygen/classllvm_1_1MachineInstrBuilder.html
- <https://github.com/banach-space/llvm-tutor>
- LLVM IR opcode:  [llvm-project/Instruction.cpp at release/13.x · llvm/llvm-project (github.com)](https://github.com/llvm/llvm-project/blob/release/13.x/llvm/lib/IR/Instruction.cpp#L338-L417)

-   **LLVM IR**
    -   _”LLVM IR Tutorial-Phis,GEPs and other things, ohmy!”_, V.Bridgers, F. Piovezan, EuroLLVM, ([slides](https://llvm.org/devmtg/2019-04/slides/Tutorial-Bridgers-LLVM_IR_tutorial.pdf), [video](https://www.youtube.com/watch?v=m8G_S5LwlTo&feature=youtu.be))
    -   _"Mapping High Level Constructs to LLVM IR"_, M. Rodler ([link](https://mapping-high-level-constructs-to-llvm-ir.readthedocs.io/en/latest/))
-   **Examples in LLVM**
    -   Control Flow Graph simplifications: [llvm/examples/IRTransforms/](https://github.com/llvm/llvm-project/tree/release/13.x/llvm/examples/IRTransforms)
    -   Hello World Pass: [llvm/lib/Transforms/Hello/](https://github.com/llvm/llvm-project/blob/release/13.x/llvm/lib/Transforms/Hello)
    -   Good Bye World Pass: [llvm/examples/Bye/](https://github.com/llvm/llvm-project/tree/release/13.x/llvm/examples/Bye)
-   **LLVM Pass Development**
    -   _"Writing an LLVM Optimization"_, Jonathan Smith [video](https://www.youtube.com/watch?v=MagR2KY8MQI&t)
    -   _"Getting Started With LLVM: Basics "_, J. Paquette, F. Hahn, LLVM Dev Meeting 2019 [video](https://www.youtube.com/watch?v=3QQuhL-dSys&t=826s)
    -   _"Writing an LLVM Pass: 101"_, A. Warzyński, LLVM Dev Meeting 2019 [video](https://www.youtube.com/watch?v=ar7cJl2aBuU)
    -   _"Writing LLVM Pass in 2018"_, Min-Yih Hsu [blog](https://medium.com/@mshockwave/writing-llvm-pass-in-2018-preface-6b90fa67ae82)
    -   _"Building, Testing and Debugging a Simple out-of-tree LLVM Pass"_ Serge Guelton, Adrien Guinet, LLVM Dev Meeting 2015 ([slides](https://llvm.org/devmtg/2015-10/slides/GueltonGuinet-BuildingTestingDebuggingASimpleOutOfTreePass.pdf), [video](https://www.youtube.com/watch?v=BnlG-owSVTk&index=8&list=PL_R5A0lGi1AA4Lv2bBFSwhgDaHvvpVU21))
-   **Legacy vs New Pass Manager**
    -   _"New PM: taming a custom pipeline of Falcon JIT"_, F. Sergeev, EuroLLVM 2018 ([slides](http://llvm.org/devmtg/2018-04/slides/Sergeev-Taming%20a%20custom%20pipeline%20of%20Falcon%20JIT.pdf), [video](https://www.youtube.com/watch?v=6X12D46sRFw))
    -   _"The LLVM Pass Manager Part 2"_, Ch. Carruth, LLVM Dev Meeting 2014 ([slides](https://llvm.org/devmtg/2014-10/Slides/Carruth-TheLLVMPassManagerPart2.pdf), [video](http://web.archive.org/web/20160718071630/http://llvm.org/devmtg/2014-10/Videos/The%20LLVM%20Pass%20Manager%20Part%202-720.mov))
    -   _”Passes in LLVM, Part 1”_, Ch. Carruth, EuroLLVM 2014 ([slides](https://llvm.org/devmtg/2014-04/PDFs/Talks/Passes.pdf), [video](https://www.youtube.com/watch?v=rY02LT08-J8))
-   **LLVM Based Tools Development**
    -   _"Introduction to LLVM"_, M. Shah, Fosdem 2018, [link](http://www.mshah.io/fosdem18.html)
    -   _"Building an LLVM-based tool. Lessons learned"_, A. Denisov, [blog](https://lowlevelbits.org/building-an-llvm-based-tool.-lessons-learned/), [video](https://www.youtube.com/watch?reload=9&v=Yvj4G9B6pcU)




