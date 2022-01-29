//
// Created by haohua on 29/1/2022.
// Code From  https://github.com/banach-space/llvm-tutor/blob/main/lib/MBASub.cpp
//

#include "llvm/ADT/Statistic.h"
#include "MBASub.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/Transforms/Utils/BasicBlockUtils.h"

using namespace llvm;


#define DEBUG_TYPE "mba-sub"
STATISTIC(SubstCount, "The # of substituted instructions");


//-----------------------------------------------------------------------------
// The helper function Implementation
//-----------------------------------------------------------------------------
bool LegacyMBASub::auxRunOnBasicBlock(llvm::BasicBlock &BB) {
    bool changed = false;
    // loop over all instructions in the block and replace certain instructions.
    // (use iterator instead of for-range loop)
    for (auto Inst = BB.begin(); Inst != BB.end(); Inst++){
        // skip non-binary instructions (e.g. unary or compare)
        auto *BinOp = dyn_cast<BinaryOperator>(Inst);
        if (BinOp == nullptr) continue; // "dyn_cast" will return nullptr if nothing there.

        // skip instruction other than integer subtraction....
        unsigned Opcode = BinOp->getOpcode();
        if (Opcode != Instruction::Sub || !BinOp->getType()->isIntegerTy())
            continue;

        // LLVM API for creating instructions and inserting into basic block..
        IRBuilder<> Builder(BinOp);

        // create an instruction representing (a + ~b) + 1
        Instruction *NewValue = BinaryOperator::CreateAdd(
                Builder.CreateAdd(BinOp->getOperand(0),
                                   Builder.CreateNot(BinOp->getOperand(1))),
                                   ConstantInt::get(BinOp->getType(), 1)
                );


        // The following is visible only if you pass -debug on the command line *and* you have an assert build.
        LLVM_DEBUG(dbgs() << *BinOp << " -> " << *NewValue << "\n");

        // replace `(a-b)` with `(a + ~b) + 1`
        ReplaceInstWithInst(BB.getInstList(), Inst, NewValue);
        changed = true;

        // update the statistics
        ++SubstCount;
    }
    return changed;
}

//-----------------------------------------------------------------------------
// MBASub Implementation
//-----------------------------------------------------------------------------
bool LegacyMBASub::runOnFunction(llvm::Function &F) {
    bool changed = false;
    for (auto &BB : F){
        changed |= auxRunOnBasicBlock(BB);
    }
    return changed;
}


//-----------------------------------------------------------------------------
// Legacy PM Registration
//-----------------------------------------------------------------------------
char LegacyMBASub::ID = 0;
// Register the pass - required for (among others) opt
static RegisterPass<LegacyMBASub> X(/*PassArg=*/"legacy-mba-sub",
                                    /*Name=*/"MBASub",
                                    /*CFGOnly=*/true,
                                    /*is_analysis=*/false);