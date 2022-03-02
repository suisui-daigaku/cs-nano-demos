#include <vector>
#include "llvm/Support/raw_ostream.h"
#include "llvm/Pass.h" 


using namespace llvm;


class Analysis : public ModulePass{
private:
    std::vector<unsigned> Stats; 

public:
    static char ID; 

    Analysis() : ModulePass(ID) {}

    void getAnalysisUsage(AnalysisUsage &AU) const override; 
    bool runOnModule(Module &M) override;

    /**
    * @brief Return the gathered statstics.
    */
    std::vector<unsigned> getStats() const { 
        return Stats; 
    }
}; 