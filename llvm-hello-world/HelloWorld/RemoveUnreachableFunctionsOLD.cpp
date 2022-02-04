//
// Created by haohua on 4/2/2022.
//

#include "llvm/IR/PassManager.h"
#include "llvm/IR/Function.h"
#include "llvm/Pass.h"


namespace {
    struct RemoveUnreachableFunctionsOLD : public llvm::FunctionPass {
        static char ID;
        RemoveUnreachableFunctionsOLD() : llvm::FunctionPass(ID) {}

        bool runOnFunction(llvm::Function &F) override {
            bool changed = false;
            if (F.getName() == "f3") {
                F.eraseFromParent();
            }
            return changed;
        }
    };
}

//------------------------------------------------------------------------------
// Legacy PM Registration
//------------------------------------------------------------------------------
char RemoveUnreachableFunctionsOLD::ID = 0;
// #1 REGISTRATION FOR "opt -analyze -legacy-static-cc"
llvm::RegisterPass<RemoveUnreachableFunctionsOLD>
        X(/*PassArg=*/"remove-unreachable-functions-old",
        /*Name=*/"RemoveUnreachableFunctionsOLD",
        /*Only looks at CFG*/true,
        /*is_analysis=*/false);