# LLVM Pass 小作业

写小作业是最快的学习方法。

## 主要资料
主要是 <https://github.com/banach-space/llvm-tutor> 的作业。

## 疑问
- 看看 InjectFuncCall 里面一堆不会，为什么指针类型创建到类型的指针，String 的只要指针的话，原来的对象在哪里。。。。LLVM 的 doc 也太简洁了。。。
- 为什么 LLVM 不能统计 indirect call 的次数 ? (这里 indirect call 指 function pointer, 去看看 `getCalledFunction` 源码研究一下，就像以前学 ***OMPL*** 的时候，去看源码)

## 其他
[Enna1 (Enna1) (github.com)](https://github.com/Enna1)

在字节工作的大佬，主攻编译原理，他最主要学习方法就是**看 LLVM 源码**。

[Andrzej Warzyński](https://github.com/banach-space)

在 ARM 工作的大佬。


### 如何运行
```
mkdir build & cd build 
cmake -DLT_LLVM_INSTALL_DIR="/usr/local" ..
make

```
### To Do list

- [ ] 将 ***LLVM-tutor*** 所有例子全部实现一次 https://github.com/banach-space/llvm-tutor#helloworld-your-first-pass 。每个 Module 的 Legacy 都写一下作业。。。。
  - [x] HelloWorld - Analysis 
  - [x] OpcodeCounter - Analysis 
  - [x] InjectFuncCall - Transformation (如果插入函数，每次运行程序都会 HelloWorld) 
  - [x] StaticCallCounter - Analysis (编译的时候计数)
    - [ ] 研究 [StaticMain.cpp](https://github.com/banach-space/llvm-tutor/blob/main/tools/StaticMain.cpp) 源码。**这个是 Pass Manager 的不需要 `opt` 的例子。**
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

### 参考资料
参考 LLVM Tutor 足够了 https://github.com/banach-space/llvm-tutor
这个文档会解释各种问题 (比如 `clang` 的参数，LLVM IR 到底有哪些，等等) 
- LLVM IR opcode:  [llvm-project/Instruction.cpp at release/13.x · llvm/llvm-project (github.com)](https://github.com/llvm/llvm-project/blob/release/13.x/llvm/lib/IR/Instruction.cpp#L338-L417)

教程末尾的参考资料，非常有用。
Below is a list of LLVM resources available outside the official online documentation that I have found very helpful. Where possible, the items are sorted by date.
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


其他比较有用的资料
- [Writing an LLVM Pass — LLVM 13 documentation](https://llvm.org/docs/WritingAnLLVMPass.html)
- [LLVM中的pass及其管理机制_大头蚂蚁的窝-CSDN博客_llvm pass](https://blog.csdn.net/mamamama811/article/details/110165333)
- https://llvm.org/doxygen/classllvm_1_1MachineInstrBuilder.html
- https://www.jianshu.com/p/9f450969121b
- https://llvm.org/docs/GettingStarted.html
- ARM 编译器工程师写的教程。
  - https://twitter.com/_banach_space/status/1194896049615384577?s=20
  - https://github.com/banach-space/llvm-tutor
  - Slides: https://llvm.org/devmtg/2019-10/slides/Warzynski-WritingAnLLVMPass.pdf
  - Videos: [2019 LLVM Developers’ Meeting: A. Warzynski “Writing an LLVM Pass: 101” - YouTube](https://www.youtube.com/watch?v=ar7cJl2aBuU)
- [Writing an LLVM Backend — LLVM 13 documentation](https://llvm.org/docs/WritingAnLLVMBackend.html)
- [abenkhadra/llvm-pass-tutorial: A step-by-step tutorial for building an LLVM sample pass (github.com)](https://github.com/abenkhadra/llvm-pass-tutorial)
- [haohua-li/CSCD70: CSCD70 Compiler Optimization (github.com)](https://github.com/haohua-li/CSCD70)
- [Home Page of Toby Ho](https://tobyho.com/)
- [LLVM Tutorial #1: Introduction - YouTube](https://www.youtube.com/watch?v=DWHDjVI5juo)
- [quarkslab/llvm-passes: Collection of various llvm passes (github.com)](https://github.com/quarkslab/llvm-passes)
- [Make sure we include our SGX pass in opt tool · jakobbotsch/llvm-sgx@cd9c75f (github.com)](https://github.com/jakobbotsch/llvm-sgx/commit/cd9c75f2356f7c459fb2e7fdd5bf9c4235012f6b)
- [ikos/CMakeLists.txt at master · NASA-SW-VnV/ikos (github.com)](https://github.com/NASA-SW-VnV/ikos/blob/master/CMakeLists.txt)
- [PacktPublishing/Learn-LLVM-12: Learn LLVM 12, published by Packt (github.com)](https://github.com/PacktPublishing/Learn-LLVM-12)


### 什么是 Pass 
LLVM Pass 的 Pass 是 “趟/遍" 的意思。因为优化阶段实际上由多个 Pass 顺序构成。
图片来自《Engineering a Compiler》 ，属于 Fair Use 。

### 如何配置 VS Code 
按照 LLVM 的官方教程安装好 LLVM 之后，install 会把 `build` 文件夹里面的二进制文件，header files 全部复制到 **目标目录**，默认是 `/usr/local/` 。如果 VS Code 发神经找不到 `<llvm>` 的文件，就去 `includePath` 把 `/usr/local` 加进去。

### 写个 Hello World 
- LLVM 官方教程: [Writing an LLVM Pass — LLVM 13 documentation](https://llvm.org/docs/WritingAnLLVMPass.html)
	- 基于官方教程的笔记 [LLVM安装 (haohua-li.github.io)](https://haohua-li.github.io/2022/01/18/llvm-installation.html)
- LLVM tutor 的教程 https://github.com/banach-space/llvm-tutor#helloworld-your-first-pass

### 创建项目
- build ***out-of-tree*** : as known as ***standalone*** , builds against a binary LLVM installation (no need to modify the LLVM source code directly)
  - more flexible, no need to synchronize with LLVM 
  - more clear, as only important changes would be kept (though GitHub can show the differences in the fork).  
  - faster, can run in the new devices without re-building from source code. 
- CMake building system  
  - including the CMake build scripts, test cases (Python testing???). 

### 关于 Clang 
不能用 `-O0` ，否则不会启动任何优化。
[banach-space/llvm-tutor: A collection of out-of-tree LLVM passes for teaching and learning (github.com)](https://github.com/banach-space/llvm-tutor#overview-of-the-passes)

### 项目的文件
有关于各种基础的详细介绍。值得读完。
[banach-space/llvm-tutor: A collection of out-of-tree LLVM passes for teaching and learning (github.com)](https://github.com/banach-space/llvm-tutor#overview-of-the-passes)

### LLVM Pass Registration 

一般而言，Pass是动态加载的 (例如 `opt`)，但是也可以把 Pass 加入到**系统的 Optimization Piplelines.** 具体看 https://github.com/banach-space/llvm-tutor#auto-registration-with-optimisation-pipelines 

然后就可以 `-O{1|2|3}` 等等都可以顺带启动你的 Pass 。

顺序也可以调整，在 Write An Pass 的 LLVM 教程就有 https://llvm.org/docs/WritingAnLLVMPass.html#basic-code-required

### Analysis and Transform Passes 

教程有

### LLVM Pass Manager 

管理 Passes 的运行顺序。 因为某些 Passes 是依赖关系的 (流水线) 。



### Dynamic & Static 
可能要学什么是 Shared Object 。
- <https://github.com/banach-space/llvm-tutor#llvm-plugins-as-shared-objecs>
- [Linux Tutorial - Static, Shared Dynamic and Loadable Linux Libraries (yolinux.com)](http://www.yolinux.com/TUTORIALS/LibraryArchives-StaticAndDynamic.html)

CMake 也有问是 Static, Shared, 还是 Module 。
 [Dynamic vs Static Plugins](https://github.com/banach-space/llvm-tutor#dynamic-vs-static-plugins)


 ### 比较值得学习的源码
- LLVM 官方的优化 https://github.com/banach-space/llvm-tutor#optimisation-passes-inside-llvm



