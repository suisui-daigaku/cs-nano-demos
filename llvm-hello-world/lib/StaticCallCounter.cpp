#include "StaticCallCounter.h"

using namespace llvm; 


//------------------------------------------------------------------------------
// Helper functions
//------------------------------------------------------------------------------
static void printStaticCCResult(raw_ostream &OutS, const ResultStaticCC &DirectCalls) {
  OutS << "=================================================\n"; 
  OutS << "LLVM-TUTOR: static analysis results\n";
  OutS << "=================================================\n";
  const char *str1 = "NAME";
  const char *str2 = "#N DIRECT CALLS";
  OutS << format("%-20s %-10s\n", str1, str2);
  OutS << "------------------------------------------------\n";

  for (auto &CallCount : DirectCalls) {
    OutS << format("%-20s %-10lu\n", CallCount.first->getName().str().c_str(),
                   CallCount.second);
  }

  OutS << "-------------------------------------------------"
       << "\n\n";
}


//------------------------------------------------------------------------------
// Legacy StaticCallCounter Implementation
//------------------------------------------------------------------------------
ResultStaticCC LegacyStaticCallCounter::auxFuncCounter(Module& M){
    llvm::MapVector<const llvm::Function*, unsigned> result; 

    for (Function &Func : M){
        for (BasicBlock &BB : Func){
            for (Instruction &Ins : BB){
                // If this a call instruction then CB will be not null 
                // (CB includes InvokeInst and CallInst, and see the doc)
                auto *CB = dyn_cast<CallBase>(&Ins);  // If the struction is callable... 
                if (nullptr == CB) continue; 
            
                // If CB is a direct function call then DirectInvoc will be not null 
                auto DirectInvoc = CB->getCalledFunction();
                if (nullptr == DirectInvoc) continue; 

                // update the countfor the callee. 
                auto callCount = result.find(DirectInvoc); 
                if (callCount == result.end()){
                    callCount = result.insert(std::make_pair(DirectInvoc, 0)).first; 
                }
                callCount->second++; 
            }
        }
    }


    return result; 
}

bool LegacyStaticCallCounter::runOnModule(Module& M){
    directCalls = auxFuncCounter(M); 
    return false; 
}

void LegacyStaticCallCounter::print(llvm::raw_ostream &OutS, llvm::Module const *M) const{
    printStaticCCResult(OutS, directCalls); 
}


//------------------------------------------------------------------------------
// Legacy PM Registration
//------------------------------------------------------------------------------
char LegacyStaticCallCounter::ID = 0;
// #1 REGISTRATION FOR "opt -analyze -legacy-static-cc"
RegisterPass<LegacyStaticCallCounter>
    X(/*PassArg=*/"legacy-static-cc",
      /*Name=*/"LegacyStaticCallCounter",
      /*CFGOnly=*/true,
      /*is_analysis=*/true);