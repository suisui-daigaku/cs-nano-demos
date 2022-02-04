# Writing a custom LLVM IR generator

由于书中的代码太老旧了，这里弄了非常久。

## 参考资料

*Get Started with LLVM core Libraries* -  Writing a custom LLVM IR generator pp129

[Creating a function using LLVM IRBuilder (freecompilercamp.org)](https://freecompilercamp.org/llvm-ir-func1/)

[3. Kaleidoscope: Code generation to LLVM IR — LLVM 15.0.0git documentation](https://llvm.org/docs/tutorial/MyFirstLanguageFrontend/LangImpl03.html)

[llvm学习日记七：编写一个LLVM IR生成器 | 码农家园 (codenong.com)](https://www.codenong.com/js9ac199bf1815/)

## 不使用 IR Builder 

### 编译

需要链接 LLVM 的核心库，否则会 symbol not found。还需要 include header files. 

```bash
usr/bin/clang++ -g -std=c++14 sum_ll_without_builder.cpp `llvm-config --cxxflags --ldflags --system-libs --libs core bitwriter` -o toy
```

构建时间会比较久(不知道为什么)，然后会生成一个非常大的二进制(估计是因为静态的关系)。

运行后可以用 `llvm-dis` 解码，跟想象中确实差不多。

```cpp
; ModuleID = 'sum.bc'
source_filename = "sum.ll"
target triple = "x86_64-apple-macosx12.0.0"

define private i32 @sum(i32 %a, i32 %b) {
entry:
  %a.addr = alloca i32, align 4
  %b.addr = alloca i32, align 4
  store i32 %a, i32* %a.addr, align 4
  store i32 %b, i32* %b.addr, align 4
  %0 = load i32, i32* %a.addr, align 4
  %1 = load i32, i32* %b.addr, align 4
  %add = add i32 %0, %1
  ret i32 %add
}
```

### 代码

需要注意的是 `LLVMContext` 要么是 global variable ，要么用 `shared_ptr<>` 防止 out of scope. 

否则如果在 local stack frame 声明，被回收后，如果继续使用 `llvm::Module` 会出现 segmentation faults. 

(这时候就体验出 `GDB` 的用处了，可以在程序插入 Breakpoint , 知道 segmentation fault 在哪里出现)

由于篇幅关系，可以直接看 [`sum_ll_without_builder.cpp` ](../LLVM_Core_Libraries_Book/sum_ll_without_builder.cpp) 

## 使用 IR Builder 

使用 IR Builder 会更快捷。

