# CMake 笔记
CMake 是魔法🔮 

虽然 CMake 貌似没有 `uninstall` 的功能，但是貌似生成各种 IDE 的项目文件非常强。
有了 CMake 的话，貌似什么 IDE 已经不重要了。

- [How to debug a pass on Linux IDE, like Clion - Beginners - LLVM Discussion Forums](https://llvm.discourse.group/t/how-to-debug-a-pass-on-linux-ide-like-clion/1300/2)

- [[原创]Using Microsoft Visual Studio 2019 Building A LLVM Out-Source-Tree Pass-编程技术-看雪论坛-安全社区|安全招聘|bbs.pediy.com](https://bbs.pediy.com/thread-258972.htm)

- [banach-space/llvm-tutor: A collection of out-of-tree LLVM passes for teaching and learning (github.com)](https://github.com/banach-space/llvm-tutor#debugging)

- [Ubpa/UCMake: Ubpa CMake (github.com)](https://github.com/Ubpa/UCMake)


### 动态链接
[我的经验书十年磨一剑 (blinkenshell.org)](http://nicephil.blinkenshell.org/my_book/index.html)
[MacOS 下的动态链接 - 知乎 (zhihu.com)](https://zhuanlan.zhihu.com/p/331750226)

### CMake 教程
[cmake--动态库之配置（第一篇） | 金宝的博客 (jinbaotang.cn)](https://jinbaotang.cn/2021/06/20/cmake1/)



### Specify Compiler in CMake 
[FAQ · Wiki · CMake / Community · GitLab (kitware.com)](https://gitlab.kitware.com/cmake/community/-/wikis/FAQ#how-do-i-use-a-different-compiler)
[How to specify new GCC path for CMake - Stack Overflow](https://stackoverflow.com/questions/17275348/how-to-specify-new-gcc-path-for-cmake)
- 方法1 :  使用系统变量 
```bash 
`CC=gcc-4.2 CXX=/usr/bin/g++-4.2 cmake -G "Your Generator" path/to/your/source`
```
- 方法2 : 用 `cmake -D`  
```bash
cmake -G "Your Generator" -D CMAKE_C_COMPILER=gcc-4.2 -D CMAKE_CXX_COMPILER=g++-4.2 path/to/your/source
```
- 方法3 : 避免使用。用 `set` 设置 `CMAKE_C_COMPILER` 和 `CMAKE_CXX_COMPILER` 。具体原因看 Stackoverflow 。主要是 CMake 在 Build 之前都检查编译器，用 `set` 会在检查完原来的编译器后替换掉原来的编译器，也就是新指定的编译器没有被检查。除此之外还有 Cache 的问题

---
在 CLion 的 CMake setting 的 Environment 那里可以设置 CC 和 CXX 。
![[Pasted image 20220202150625.png]]

---
CMake 在检查编译器的时候会说 `skipped` 。
这就要看看这里 
- [enable_language: Assume compiler works if ABI detection compiles (!4789) · Merge requests · CMake / CMake · GitLab (kitware.com)](https://gitlab.kitware.com/cmake/cmake/-/merge_requests/4789) 
- [cmake - Check for working C compiler: "cl.exe - skipped" : Visual Studio 2019 - Stack Overflow](https://stackoverflow.com/questions/64212759/check-for-working-c-compiler-cl-exe-skipped-visual-studio-2019)
StackOverflow 的大佬回答的。
大意就是说 CMake 应该先检查 **ABI** 信息，然后在检查 Compiler 。
因为两部分都使用了 `try_compile` ，所以如果 ABI 失败的话，就证明 Compiler 也不能用。
所以只要 ABI 成功，就会直接 `skipped` 掉 Compiler 的测试。

有点奇怪的是，这样的问题竟然在2020才被发现? 

