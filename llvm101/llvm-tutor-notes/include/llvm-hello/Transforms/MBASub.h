//
// Created by haohua on 29/1/2022.
//

#ifndef LLVM_TUTOR_MBASUB_H
#define LLVM_TUTOR_MBASUB_H

#include "llvm/IR/PassManager.h"
#include "llvm/Pass.h"

struct LegacyMBASub : public llvm::FunctionPass {
    static char ID; // LLVM use the address to identify this pass (the value doesnot matter)
    LegacyMBASub() : llvm::FunctionPass(ID) {}
    bool runOnFunction(llvm::Function &F) override;
    // the auxiliary method on basic block in the function.
    static bool auxRunOnBasicBlock(llvm::BasicBlock &BB);
};


#endif
