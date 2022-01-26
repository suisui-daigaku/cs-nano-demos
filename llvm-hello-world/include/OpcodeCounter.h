//=============================================================================
// FILE:
//    OpcodeCounter.cpp
//
// DESCRIPTION:
//    Visits all instructions in a function and counts how many times every
//    LLVM IR opcode was used. Prints the output to stderr.
// 
//    This example demonstrates how to insert your pass at one of the
//    predefined extension points, e.g. before any other transformations are
//    run (i.e. via `EP_EarlyAsPossible` for the Legacy PM) or whenever the
//    vectoriser is run (i.e. via `registerVectorizerStartEPCallback` for the
//    new PM).
//
// USAGE:
//    1. Legacy PM
//      opt -load libOpcodeCounter.dylib -legacy-opcode-counter `\`
//        -analyze <input-llvm-file>
//    2. New PM
//      opt -load-pass-plugin libOpcodeCounter.dylib `\`
//        -passes="print<opcode-counter>" `\`
//        -disable-output <input-llvm-file>
//    3. Automatically through an optimisation pipeline - legacy PM
//      opt -load libOpcodeCounter.dylib -O{0|1|2|3|s} -disable-output `\`
//        <input-llvm-file>
//    4. Automatically through an optimisation pipeline - new PM
//      opt -load-pass-plugin libOpcodeCounter.dylib --passes='default<O1>' `\`
//        -disable-output <input-llvm-file>
//
// License: MIT
//=============================================================================
// Taken from the following github file 
//   - https://github.com/banach-space/llvm-tutor/blob/main/include/OpcodeCounter.h
//=============================================================================


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