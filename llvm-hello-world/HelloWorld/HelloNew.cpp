#include "llvm/Pass.h"
#include "llvm/IR/Function.h"
#include "llvm/Support/raw_ostream.h"

#include "llvm/Passes/PassBuilder.h"
#include "llvm/Passes/PassPlugin.h"


using namespace llvm;
// the "static" keyword to file in C, which means the anonymous namespace is only visible to the current file. 
namespace {
// This method implements what the pass does
void visitor(Function &F) {
    errs() << "(llvm-tutor) Hello from: "<< F.getName() << "\n";
    errs() << "(llvm-tutor)   number of arguments: " << F.arg_size() << "\n";
}
//-----------------------------------------------------------------------------
// New PM implementation 
//-----------------------------------------------------------------------------
struct HelloWorldNew : PassInfoMixin<HelloWorldNew>{
    // Main entry point, takes IR unit to run the pass on (&F) and the corresponding pass manager (to be queried if need be)
    PreservedAnalyses run(Function &F, FunctionAnalysisManager &){
        errs() << ">>>> The New PM <<<<\n"; 
        visitor(F);
        return PreservedAnalyses::all(); 
    }
};
} // namespace (without ; )

//-----------------------------------------------------------------------------
// New PM Registration
//-----------------------------------------------------------------------------
llvm::PassPluginLibraryInfo getHelloWorldPluginInfo() {
  return {LLVM_PLUGIN_API_VERSION, "Hello World(New)", LLVM_VERSION_STRING,
          [](PassBuilder &PB) {
            PB.registerPipelineParsingCallback(
                [](StringRef Name, FunctionPassManager &FPM,
                   ArrayRef<PassBuilder::PipelineElement>) {
                  if (Name == "hello-new") {
                    FPM.addPass(HelloWorldNew());
                    return true;
                  }
                  return false;
                });
          }};
}

// This is the core interface for pass plugins. It guarantees that 'opt' will
// be able to recognize HelloWorld when added to the pass pipeline on the
// command line, i.e. via '-passes=hello-world'
extern "C" LLVM_ATTRIBUTE_WEAK ::llvm::PassPluginLibraryInfo
llvmGetPassPluginInfo() {
  return getHelloWorldPluginInfo();
}