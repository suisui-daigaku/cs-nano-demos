//=============================================================================
// ALL DOCUMENTATIONS IN HEADER FILE 
//=============================================================================

#include "llvm-hello/Analysis/OpcodeCounter.h"
// ---- 
#include "llvm/IR/LegacyPassManager.h"
#include "llvm/Transforms/IPO/PassManagerBuilder.h"

using namespace llvm;

//------------------------------------------------------------------------------
// Helper functions - implementation (local)
//------------------------------------------------------------------------------
static void printOpcodeCounterResult(raw_ostream &outS, const LegacyOpcodeCounter::ResultOpcodeCounter &opcodeMap){
    outS << "=================================================\n";
    outS << "LLVM-TUTOR: OpcodeCounter results\n";
    outS << "=================================================\n";
    const char *str1 = "OPCODE"; 
    const char *str2 = "#TIMES USED"; 
    outS << format("%-20s %-10s\n", str1, str2); 
    outS << "-------------------------------------------------\n"; 
    for (auto &inst : opcodeMap){
        outS << format("%-20s %-10lu\n", inst.first().str().c_str(), inst.second); 
    }
    outS << "-------------------------------------------------\n\n";
}


//-----------------------------------------------------------------------------
// Legacy PM OpcodeCounter implementation
//-----------------------------------------------------------------------------
LegacyOpcodeCounter::ResultOpcodeCounter LegacyOpcodeCounter::generateOpcodeMap(llvm::Function& Func){
    ResultOpcodeCounter opcodeMap; 
    for (auto &BB : Func){ // basic block
        for (auto &Inst : BB){
            StringRef name = Inst.getOpcodeName(); 
            if (opcodeMap.find(name) == opcodeMap.end()){
                opcodeMap[name] = 1; 
            }else{
                opcodeMap[name]++; 
            }
        }
    }
    return opcodeMap; 
}


bool LegacyOpcodeCounter::runOnFunction(llvm::Function& F){
    result = generateOpcodeMap(F);  
    return false; 
}

void LegacyOpcodeCounter::print(llvm::raw_ostream& outS, llvm::Module const *m) const{
    printOpcodeCounterResult(outS, result); 
}

//-----------------------------------------------------------------------------
// Legacy PM Registration
//-----------------------------------------------------------------------------
char LegacyOpcodeCounter::ID = 0;
// #1 REGISTRATION FOR "opt -analyze -legacy-opcode-counter"
static RegisterPass<LegacyOpcodeCounter> X(/*PassArg=*/"legacy-opcode-counter",
                                           /*Name=*/"Legacy OpcodeCounter Pass",
                                           /*CFGOnly=*/true,
                                           /*is_analysis=*/false);


/* 这部分内容也在 https://llvm.org/docs/WritingAnLLVMPass.html 
 * 把当前的 Pass 插入到已有的 pipeline, 这就意味着不需要 opt 。
 *  (文档也有介绍 PassManagerBuilder::EP_EarlyAsPossible 和 PassManagerBuilder::EP_FullLinkTimeOptimizationLast)
 * #2 REGISTRATION FOR "-O{0|1|2|3}"
 * Register LegacyOpcodeCounter as a step of an existing pipeline. The insertion
 * point is set to 'EP_EarlyAsPossible', which means that LegacyOpcodeCounter
 * will be run automatically at '-O{0|1|2|3}'. */ 

// static llvm::RegisterStandardPasses
//     RegisterOpcodeCounter(llvm::PassManagerBuilder::EP_EarlyAsPossible,
//                           [](const llvm::PassManagerBuilder &Builder,
//                              llvm::legacy::PassManagerBase &PM) {
//                             PM.add(new LegacyOpcodeCounter());
//                           });