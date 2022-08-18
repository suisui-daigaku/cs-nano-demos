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
// Or use the lambda function to make things cleanner.... 
// add the HelloWorldPass to the optimization pipleline 
//  https://llvm.org/docs/WritingAnLLVMPass.html#basic-code-required
static RegisterStandardPasses Y(
    PassManagerBuilder::EP_EarlyAsPossible,
    [](const PassManagerBuilder &Builder, legacy::PassManagerBase &PM) { PM.add(new HelloWorldPass());}
  );
