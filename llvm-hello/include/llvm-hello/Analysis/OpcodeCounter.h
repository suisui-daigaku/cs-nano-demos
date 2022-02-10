#ifndef LLVM_TUTOR_OPCODECOUNTER_H
#define LLVM_TUTOR_OPCODECOUNTER_H

#include "llvm/IR/PassManager.h"
#include "llvm/IR/Function.h"
#include "llvm/Pass.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/ADT/StringMap.h"
//------------------------------------------------------------------------------
// Legacy PM interface
//------------------------------------------------------------------------------
struct LegacyOpcodeCounter : public llvm::FunctionPass{
    using ResultOpcodeCounter = llvm::StringMap<unsigned>; 

    static char ID; 
    LegacyOpcodeCounter() : llvm::FunctionPass(ID) {}
    virtual bool runOnFunction(llvm::Function& F) override; 
    // In legacy pass manager, the print method must be implemented for 
    // analysis passes, to print human-readable results. 
    // use -analyze to invoke print method. Note that FunctionPass is from Pass.h
    //      http://llvm.org/docs/WritingAnLLVMPass.html#the-print-method
    virtual void print(llvm::raw_ostream& OutS, llvm::Module const *M) const override; 

    // helper functions in the class  
    ResultOpcodeCounter generateOpcodeMap(llvm::Function &F); 
    ResultOpcodeCounter result;
};



#endif