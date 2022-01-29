/*****************************************************************************
 * From
 *  https://github.com/banach-space/llvm-tutor/blob/main/lib/RIV.cpp
 *  The author is Andrzej Warzyński
 *
 * Description:
 *      For every basic block in the given function, this pass creates a list
 *      of integer values that are visible/reachable from the block.
 *      It uses the results of the DominatorTree pass.
 *
 * Algorithm:
 *      v_N = set of integer values defined in basic block N
 *      RIV_N = set of reachable integer values for the basic block N
 *      ----------------------------------------------------------------
 *      STEP 1:
 *      For every basic block N in F:
 *          compute v_N and store it in the DefinedValueMap
 *      ----------------------------------------------------------------
 *      STEP 2:
 *      Compute the RIVs for the entry block in the function (BB_0):
 *          RIV_0 = {input args, global vars}
 *      ----------------------------------------------------------------
 *      STEP 3:
 *      Traverse the CFG and for every BB_M that BB_N dominates,
 *      calculate RIV_M as follows,
 *          RIV_M = {RIV_N, v_N}
 ****************************************************************************/

#include "RIV.h"
#include "llvm/Support/Format.h"
#include <queue>


using namespace llvm;

// DominatorTree node types used in RIV. One could use auto instead, but IMO
// being verbose makes it easier to follow.
using NodeTy = llvm::DomTreeNodeBase<llvm::BasicBlock> *;
// A map that a basic block BB holds a set of pointers to values defined in BB.
using DefValMapTy = LegacyRIV::ResultMapTy;

//------------------------------------------------------------------------------
// Helper functions:  Pretty-prints the result of this analysis
//------------------------------------------------------------------------------
static void printRIVResult(llvm::raw_ostream &OutS, const LegacyRIV::ResultMapTy &RIVMap){
    OutS << "=================================================\n";
    OutS << "LLVM-TUTOR: RIV analysis results\n";
    OutS << "=================================================\n";

    const char *str1 = "BB id";
    const char *str2 = "Reachable Integer Values";
    OutS << format("%-10s %-30s\n", str1, str2);
    OutS << "-------------------------------------------------\n";

    const char *EmptyStr = "";

    for (auto const &KeyVal : RIVMap){
        std::string dummyStr;
        raw_string_ostream BBIdStream(dummyStr);
        KeyVal.first->printAsOperand(BBIdStream, false);
        OutS << format("BB %-12s %-30s\n", BBIdStream.str().c_str(), EmptyStr);
        for (auto const *IntegerValue : KeyVal.second){
            std::string innerDummyStr;
            raw_string_ostream InstrStr(innerDummyStr);
            IntegerValue->print(InstrStr);
            OutS << format("%-12s %-30s\n", EmptyStr, InstrStr.str().c_str());
        }
    }
    OutS << "\n\n";
}

//-----------------------------------------------------------------------------
// RIV Implementation
//-----------------------------------------------------------------------------
LegacyRIV::ResultMapTy LegacyRIV::buildRIV(llvm::Function &F, NodeTy CFGRoot) {
    ResultMapTy resultMap;
    // Initialise a double-ended queue that will be used to traverse all BBs in the F
    std::deque<NodeTy> BBsToProcess;
    BBsToProcess.push_back(CFGRoot);

    // STEP 1: for every basic block BB compute the set of integer values defined in the BB.
    DefValMapTy definedValuesMap;
    for (BasicBlock &BB : F){
        auto &Values = definedValuesMap[&BB];
        for (Instruction &Inst : BB){
            if (Inst.getType()->isIntegerTy()){
                Values.insert(&Inst);
            }
        }
    }

    // STEP 2: compute the RIVs for the entry BB, this will include global variables input arguments.
    auto &EntryBBValues = resultMap[&F.getEntryBlock()];
    for (auto &Global : F.getParent()->getGlobalList()){
        if (Global.getValueType()->isIntegerTy()){
            EntryBBValues.insert(&Global);
        }
    }
    for (Argument &Arg : F.args()){
        if (Arg.getType()->isIntegerTy()){
            EntryBBValues.insert(&Arg);
        }
    }

    // STEP 3: traverse the CFG for every BB in F calculate its RIVs.
    while (!BBsToProcess.empty()){
        auto *Parent = BBsToProcess.back();
        BBsToProcess.pop_back();

        // get the values defined in parent.
        auto &parentDefs = definedValuesMap[Parent->getBlock()];
        // get the RIV set of for Parent
        // (since RIVMap is update on every iteration, its contents are likely to
        // be moved around when resizing. This means that we need a copy of it
        // (i.e. a reference is not sufficient).
        llvm::SmallPtrSet<llvm::Value*, 8> ParentRIVs = resultMap[Parent->getBlock()];
        // loop over all BBs that parent dominates and update their RIV sets.
        for (NodeTy Child : *Parent){
            BBsToProcess.push_back(Child);
            auto ChildBB = Child->getBlock();

            // Add values defined in Parent to the current child's set of RIV
            resultMap[ChildBB].insert(parentDefs.begin(), parentDefs.end());

            // Add parent's set of RIVs to the current child's RIV
            resultMap[ChildBB].insert(ParentRIVs.begin(), ParentRIVs.end());
        }

    }

    return resultMap;
}


bool LegacyRIV::runOnFunction(llvm::Function &F) {
    // Clear the results from previous runs.
    RIVMap.clear();

    // Get the entry node for the CFG for the input function
    NodeTy Root =
            getAnalysis<DominatorTreeWrapperPass>().getDomTree().getRootNode();

    RIVMap = buildRIV(F, Root);
    return false;
}

void LegacyRIV::print(llvm::raw_ostream &OutS, const llvm::Module *) const {
    printRIVResult(OutS, RIVMap);
}

// This method defines how this pass interacts with other passes
void LegacyRIV::getAnalysisUsage(llvm::AnalysisUsage &Info) const {
    // request results from Dominator Tree Pass
    Info.addRequired<DominatorTreeWrapperPass>();
    // wo do not modify the input module
    Info.setPreservesAll();
}

//-----------------------------------------------------------------------------
// Legacy PM Registration
//-----------------------------------------------------------------------------
char LegacyRIV::ID = 0;

// #1 REGISTRATION FOR "opt -analyze -legacy-riv"
static RegisterPass<LegacyRIV> X
        (/*PassArg=*/"legacy-riv",
        /*Name=*/"Compute Reachable Integer values",
        /*CFGOnly=*/true,
        /*is_analysis*/ true);