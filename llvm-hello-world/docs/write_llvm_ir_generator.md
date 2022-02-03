# Writing a custom LLVM IR generator

由于书中的代码太老旧了，这里弄了非常久。

## 参考资料

*Get Started with LLVM core Libraries* -  Writing a custom LLVM IR generator pp129

[Creating a function using LLVM IRBuilder (freecompilercamp.org)](https://freecompilercamp.org/llvm-ir-func1/)

[3. Kaleidoscope: Code generation to LLVM IR — LLVM 15.0.0git documentation](https://llvm.org/docs/tutorial/MyFirstLanguageFrontend/LangImpl03.html)

[llvm学习日记七：编写一个LLVM IR生成器 | 码农家园 (codenong.com)](https://www.codenong.com/js9ac199bf1815/)

## 构建

需要链接 LLVM 的核心库，否则会 symbol not found。还需要 include header files. 

```bash
clang++ -g -std=c++14 sum_ll_without_builder.cpp `llvm-config --cxxflags --ldflags --system-libs --libs core bitwriter` -o toy
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

## 代码

需要注意的是 `LLVMContext` 要么是 global variable ，要么用 `shared_ptr<>` 防止 out of scope. 

否则如果在 local stack frame 声明，被回收后，如果继续使用 `llvm::Module` 会出现 segmentation faults. 

(这时候就体验出 `GDB` 的用处了，可以在程序插入 Breakpoint , 知道 segmentation fault 在哪里出现)

```cpp
//
// Created by haohua on 3/2/2022.
//

#include <iostream>

#include "llvm/ADT/SmallVector.h"

#include "llvm/IR/Module.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/IR/Instructions.h"


#include "llvm/Support/Alignment.h"

#include "llvm/IR/Verifier.h"
#include "llvm/Bitcode/BitcodeReader.h"
#include "llvm/Bitcode/BitcodeWriter.h"
#include "llvm/Support/ToolOutputFile.h"
#include "llvm/Support/raw_ostream.h"


#include "llvm/Support/FileSystem.h"


using namespace llvm;

Module *makeLLVMModule(LLVMContext &CTX){
    Module *m = new Module("sum.ll", CTX);
    // mod->setDataLayout("..."); // the datalayout is not impportant...
    m->setTargetTriple("x86_64-apple-macosx12.0.0");

    //
    SmallVector<Type*, 2> FuncArgsTy;
    FuncArgsTy.push_back(IntegerType::get(m->getContext(), 32));
    FuncArgsTy.push_back(IntegerType::get(m->getContext(), 32));

    FunctionType *FuncTy = FunctionType::get(
            /* Result= */ IntegerType::get(m->getContext(), 32),
            /* Params= */ FuncArgsTy,
            /* isVarArgs */ false
    );

    Function *funcSum = Function::Create(
            /* Type= */ FuncTy,
            /* Linkage= */ GlobalValue::PrivateLinkage,
            /* Name= */ "sum",
            /* Module= */ m
    );
    funcSum->setCallingConv(CallingConv::C);

    Function::arg_iterator args_iter = funcSum->arg_begin();
    Value *int32_a = args_iter++;
    int32_a->setName("a");
    Value *int32_b = args_iter++;
    int32_b->setName("b");

    BasicBlock *labelEntry = BasicBlock::Create(
            m->getContext(),
            "entry",
            funcSum,
            0
    );

    // insert new instructions into the basic block we just created
    // Block entry (label_entry)
    // LLVM Programmer's manual is your best friend: https://llvm.org/docs/ProgrammersManual.html

    // AllocaInst: to allocate memory space in the stack frame...
    //  “Address Spaces in LLVM” : https://www.youtube.com/watch?v=Oj1BNoL1jpM
    AllocaInst *ptrA = new AllocaInst(IntegerType::get(m->getContext(), 32),
                                      0, "a.addr", labelEntry);
    ptrA->setAlignment(Align(4));
    AllocaInst *ptrB = new AllocaInst(IntegerType::get(m->getContext(), 32),
                                      0, "b.addr", labelEntry);
    ptrB->setAlignment(Align(4));

    // copy inputs to the stack frame
    StoreInst *st0 = new StoreInst(int32_a, ptrA, false, labelEntry);
    st0->setAlignment(Align(4));
    StoreInst *st1 = new StoreInst(int32_b, ptrB, false, labelEntry);
    st1->setAlignment(Align(4));


    // load from the stack frame to the stack location..
    LoadInst *ld0 = new LoadInst(IntegerType::get(m->getContext(), 32),
                                 ptrA, "", false, labelEntry);
    ld0->setAlignment(Align(4));
    LoadInst *ld1 = new LoadInst(IntegerType::get(m->getContext(), 32),
                                 ptrB, "", false, labelEntry);
    ld1->setAlignment(Align(4));

    // addition
    BinaryOperator *addRes = BinaryOperator::Create(Instruction::Add, ld0, ld1, "add", labelEntry);
    ReturnInst::Create(m->getContext(), addRes, labelEntry);


    return m;
}

/* to test our function  */
int main(){
    LLVMContext CTX; // Question: should I use static ?? (may not thread-safe)
    Module *mod = makeLLVMModule(CTX);

    raw_fd_ostream r(fileno(stdout), false);
    verifyModule(*mod, &r);

    std::error_code err;
    raw_fd_ostream out("./sum.bc", err, sys::fs::OF_None); // llvm file system...
    WriteBitcodeToFile(*mod,out);

    delete mod;

    return 0;
}
```

