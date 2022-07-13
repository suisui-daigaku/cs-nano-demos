#ifndef LLVM_TUTOR_DYNAMICCALLCOUNTER_H
#define LLVM_TUTOR_DYNAMICCALLCOUNTER_H

#include "llvm/IR/PassManager.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/IRBuilder.h"

//------------------------------------------------------------------------------
// Legacy PM interface
//------------------------------------------------------------------------------
struct DynamicCallCounter : public llvm::ModulePass {
    static char ID; 
    DynamicCallCounter() : llvm::ModulePass(ID) {}
    bool runOnModule(llvm::Module& M) override;  
}; 


#endif 