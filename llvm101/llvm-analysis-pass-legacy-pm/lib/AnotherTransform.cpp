#include "Analysis.h"


using namespace llvm;

namespace {

class Transform final : public FunctionPass {
public:
  static char ID;

  Transform() : FunctionPass(ID) {}

  virtual void getAnalysisUsage(AnalysisUsage &AU) const override {
    AU.addRequired<Analysis>();
    AU.addPreserved<Analysis>();
  }
  
  virtual bool runOnFunction(Function &F) override {
    outs() << "Another Transform (function pass)\n"; 
    outs() << F.getName() << "\n"; 
    std::vector<unsigned> Stats = getAnalysis<Analysis>().getStats();
    for (auto Iter = Stats.begin(); Iter != Stats.end(); ++Iter) {
      outs() << *Iter << ", ";
    }
    outs() << "\n----------------------\n";
    return false;
  }
};

char Transform::ID = 0;
RegisterPass<Transform> X("another-transform", "Another Transform");

} // anonymous namespace