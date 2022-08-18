//=============================================================================
// FILE:
//    HelloWorld.cpp
//
// DESCRIPTION:
//    Visits all functions in a module, prints their names and the number of
//    arguments via stderr. Strictly speaking, this is an analysis pass (i.e.
//    the functions are not modified). However, in order to keep things simple
//    there's no 'print' method here (every analysis pass should implement it).
//
//
// License: MIT
//=============================================================================
#include "llvm/IR/LegacyPassManager.h"
#include "llvm/Passes/PassBuilder.h"
#include "llvm/Passes/PassPlugin.h"
#include "llvm/Support/raw_ostream.h"

using namespace llvm;

static llvm::cl::list<std::string> strongbox_lists(
  "lists", llvm::cl::desc("Specify names"), llvm::cl::OneOrMore);

namespace {
// New PM implementation
struct HelloWorld : PassInfoMixin<HelloWorld> {
  PreservedAnalyses run(Function &F, FunctionAnalysisManager &) {
    errs() << "----------------------------------------------------\n"; 
    // using the pass arguments
    for(auto arg: strongbox_lists) {
      errs() << "(llvm-tutor-CLI) arg-lists: " << arg << "\n";
    }
    errs() << "(llvm-tutor) Hello from: "<< F.getName() << "\n";
    errs() << "(llvm-tutor)   number of arguments: " << F.arg_size() << "\n";
    return PreservedAnalyses::all();
  }

  static bool isRequired() { return true; }
};
} // namespace

llvm::PassPluginLibraryInfo getHelloWorldPluginInfo() {
  return {LLVM_PLUGIN_API_VERSION, "HelloWorld", LLVM_VERSION_STRING,
          [](PassBuilder &PB) {
            PB.registerPipelineStartEPCallback(
              [&](llvm::ModulePassManager &MPM, llvm::OptimizationLevel Level) {
                MPM.addPass(createModuleToFunctionPassAdaptor(HelloWorld()));
              }
            );
          }};
}

extern "C" LLVM_ATTRIBUTE_WEAK ::llvm::PassPluginLibraryInfo
llvmGetPassPluginInfo() {
  return getHelloWorldPluginInfo();
}