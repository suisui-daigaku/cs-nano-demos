//
// Created by haohua on 4/2/2022.
//

#include "llvm/IR/PassManager.h"
#include "llvm/IR/Function.h"
#include "llvm/Pass.h"
#include "llvm/ADT/TinyPtrVector.h"

#include "llvm/Support/raw_ostream.h"


namespace {
    struct RemoveUnreachableFunctionsOLD : public llvm::ModulePass {
        static char ID;
        RemoveUnreachableFunctionsOLD() : llvm::ModulePass(ID) {}

        bool runOnModule(llvm::Module &M) override {
            llvm::TinyPtrVector<llvm::Function*> toDelete;

            bool changed = false;
            for (auto it = M.begin(); it != M.end(); it++){
                if (it->getName() == "f3") {
                    toDelete.push_back(&*it);
                    changed = true;
                }
            }

            for (auto func : toDelete){
                func->eraseFromParent();
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