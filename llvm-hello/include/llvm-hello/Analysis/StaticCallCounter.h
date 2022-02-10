#ifndef LLVM_TUTOR_STATICCALLCOUNTER_H
#define LLVM_TUTOR_STATICCALLCOUNTER_H

#include "llvm/IR/PassManager.h"
#include "llvm/IR/Function.h"
#include "llvm/Pass.h"
#include "llvm/ADT/MapVector.h"
#include "llvm/IR/AbstractCallSite.h"


//------------------------------------------------------------------------------
// Legacy PM interface
//------------------------------------------------------------------------------
using ResultStaticCC = llvm::MapVector<const llvm::Function *, unsigned>;

struct LegacyStaticCallCounter : public llvm::ModulePass {
    static char ID; 
    ResultStaticCC directCalls; 
    LegacyStaticCallCounter() : llvm::ModulePass(ID) {}

    ResultStaticCC auxFuncCounter(llvm::Module &M); 
    bool runOnModule(llvm::Module &M) override; 
    // Since this is an analysis pass, 
    // the print method must be implemented by Legacy analysis passes in order to
    // print a human readable version of the analysis results:
    //      http://llvm.org/docs/WritingAnLLVMPass.html#the-print-method
    void print(llvm::raw_ostream &OutS, llvm::Module const *M) const override;
};


#endif  