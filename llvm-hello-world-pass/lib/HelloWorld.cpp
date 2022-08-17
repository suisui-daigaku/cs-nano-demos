#include "llvm/Pass.h"
#include "llvm/IR/Function.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/IR/LegacyPassManager.h"
#include "llvm/Transforms/IPO/PassManagerBuilder.h"
using namespace llvm;

namespace {
  struct HelloWorldPass : public FunctionPass {
    static char ID;
    HelloWorldPass() : FunctionPass(ID) {}

    virtual bool runOnFunction(Function &F) {
      errs() << "[HelloWorld Pass]: a function called " << F.getName() << "!\n";
      return false;
    }
  };
}

char HelloWorldPass::ID = 0;

// Automatically enable the pass.
// http://adriansampson.net/blog/clangpass.html
static void registerSkeletonPass(const PassManagerBuilder &,
                         legacy::PassManagerBase &PM) {
  PM.add(new HelloWorldPass());
}
static RegisterStandardPasses
  RegisterMyPass(PassManagerBuilder::EP_EarlyAsPossible,
                 registerSkeletonPass);
