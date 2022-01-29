//========================================================================
// FILE:
//    RIV.h , computes the set reachable integer values which are visible
//              in the basic block.
//
// DESCRIPTION:
//    Declares the RIV passes:
//      * new pass manager interface
//      * legacy pass manager interface
//      * printer pass for the new pass manager
// License: MIT
//========================================================================

#ifndef LLVM_TUTORIAL_RIV_H
#define LLVM_TUTORIAL_RIV_H

#include "llvm/IR/PassManager.h"
#include "llvm/Pass.h"
#include "llvm/ADT/MapVector.h"
#include "llvm/ADT/SmallPtrSet.h"

#include "llvm/IR/Dominators.h"
#include "llvm/IR/ValueMap.h"

//------------------------------------------------------------------------------
// Legacy PM interface
//------------------------------------------------------------------------------
struct LegacyRIV : public llvm::FunctionPass{
    // A map that for every basic block holds a set of pointers to reachable integer values for that block.
    using ResultMapTy = llvm::MapVector<llvm::BasicBlock const *, llvm::SmallPtrSet<llvm::Value *, 8>>;

    static char ID;
    LegacyRIV() : llvm::FunctionPass(ID) {}

    bool runOnFunction(llvm::Function &F) override;
    void print(llvm::raw_ostream &OutS, llvm::Module const *) const override;
    void getAnalysisUsage(llvm::AnalysisUsage &Info) const override;

    // a method to build the RIVMap
    // (the implementation of runOnFunction... )
    LegacyRIV::ResultMapTy buildRIV(llvm::Function &F, llvm::DomTreeNodeBase<llvm::BasicBlock> *CFGRoot);

    // The actual mapping computed by this pass. Note that for every invocation
    // of the compiler, only one instance of this pass is created.
    // This means that one instance of RIVMap is re-used every-time this pass is run.
    LegacyRIV::ResultMapTy RIVMap;
    LegacyRIV::ResultMapTy const &getRIVMap() const { return RIVMap; }

};

#endif //LLVM_TUTORIAL_RIV_H
