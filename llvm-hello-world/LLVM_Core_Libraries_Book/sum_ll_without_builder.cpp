//
// Created by haohua on 3/2/2022.
// llvm学习日记七：编写一个LLVM IR生成器
//   https://www.codenong.com/js9ac199bf1815/
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

Module *makeLLVMModule(){
    LLVMContext CTX; // Question: should I use static ?? (may not thread-safe)
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
    Module *mod = makeLLVMModule();
    // https://freecompilercamp.org/llvm-ir-func1/
    
    std::error_code err;
    raw_fd_ostream out("./sum.bc", err, sys::fs::OF_None); // llvm file system...
    WriteBitcodeToFile(*mod,out);

    delete mod;

    return 0;
}

