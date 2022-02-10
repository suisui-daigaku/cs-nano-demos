#ifndef LLVM_TUTOR_INSTRUMENT_BASIC_H
#define LLVM_TUTOR_INSTRUMENT_BASIC_H

#include "llvm/IR/PassManager.h"
#include "llvm/IR/Function.h"
#include "llvm/Pass.h"

//------------------------------------------------------------------------------
// Legacy PM interface
//------------------------------------------------------------------------------
struct LegacyInjectFuncCall : public llvm::ModulePass{
    static char ID; 
    LegacyInjectFuncCall() : llvm::ModulePass(ID) {}
    bool runOnModule(llvm::Module &M) override;
}; 



#endif