## 编程的本质

[11 Compilers | Computation Structures | Electrical Engineering and Computer Science | MIT OpenCourseWare](https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-004-computation-structures-spring-2017/c11/)

编程的本质是 **计算(evaluation)**、**判断(make decision)**。

### Objectives 

- 使用**面向对象编程**模拟一个简单的计算机系统(参考 MineCraft CPU), 有 Data Path 等等，貌似 SICP 也有类似的功课
- 写一个非常简单的编译器模拟 Assembly Code ，实现 MIPS 系统的子集
- 写一个非常简单的高级语言编译器，实现 Python 的子集 到 MIPS 转换 (有 Parse Tree 等等)。
- 部署到 Vue 或者 React ，做成一个 web app 







### Compilers 

[11.1 Annotated Slides | 11 Compilers | Computation Structures | Electrical Engineering and Computer Science | MIT OpenCourseWare](https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-004-computation-structures-spring-2017/c11/c11s1/)

There are two main routines in our simple compiler: 

- `compile_statement` and 
- `compile_expr`

 The job of compile_statement is to compile a single statement from the source program. 

Since the source program is a sequence of statements, we’ll be calling compile_statement repeatedly.

