#include "llvm/Pass.h"
#include "llvm/IR/Function.h"
#include "llvm/Support/raw_ostream.h"


using namespace llvm;
// the "static" keyword to file in C, which means 
// the anonymous namespace is only visible to the current file. 
namespace {
// to implement the FunctionPass interface.... (the function level pass)
struct Hello : public FunctionPass{
    // the identifier(ID) to identify the Hello pass (to avoid use expensive C++ runtime information)...
    static char ID; 
    Hello() : FunctionPass(ID) {}
    
    // to override an abstract virtual method inherited from FunctionPass.
    virtual bool runOnFunction(llvm::Function &F) override {
        errs() << "Hello: ";
        return false; 
    }
};

// LLVM uses ID's address to identify a pass (so the intilization value does not matter). 
char Hello::ID = 0; 
RegisterPass<Hello> X("hello", "Hello World Pass"); 
}; 
