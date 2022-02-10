/**********************************************************************************
 *      cd Examples
 *      clang -O0 -S -emit-llvm ./example_for_inject_function_call.c -o  ./example_for_inject_function_call.ll
 *      cd ../build
 *      opt -S -enable-new-pm=0 -load ./lib/libInjectFuncCall.dylib -legacy-inject-func-call ../Examples/example_for_inject_function_call.ll -o injected_function_bin
 *      lli injected_function_bin
 **********************************************************************************/


#include "llvm-hello/Transforms/InjectFuncCall.h"
#include "llvm/IR/IRBuilder.h"

using namespace llvm; 
#define DEBUG_TYPE "inject-func-call"

//------------------------------------------------------------------------------
// Legacy PM Implementation 
//------------------------------------------------------------------------------
bool LegacyInjectFuncCall::runOnModule(Module& M){
    bool InsertedAtLeastOnePrintf = false;

    // STEP 1: Inject the declaration of printf
    // ----------------------------------------------------------------
    // 插入 Function 的话需要声明函数类型 (the declaration of printf)
    // 其类型为 i32 @printf(i8*, ...) 对应 int printf(char*, ...)
    auto &CTX = M.getContext(); // 可能允许多个 target machine, 所以 context 很重要
    // 原本的类型为 Type::getInt8Ty(CTX)
    // 但是函数实际上是指针类型，所以需要生成到 Integer Type 的指针 (为什么？？)。
    PointerType *PrintfArgTy = PointerType::getUnqual(Type::getInt8Ty(CTX)); 
    // 创建函数类型 (给 IR Module)
    FunctionType *PrintfTy = FunctionType::get(
        IntegerType::getInt32Ty(CTX), 
        PrintfArgTy, 
        /*IsVarArgs*/true 
    );

    // 因为 Linker 只有一个 global namespace, 只要名字对上标准库的名字，就能 link 了。
    FunctionCallee Printf = M.getOrInsertFunction("printf", PrintfTy);
    // Set attributes as per inferLibFuncAttributes in BuildLibCalls.cpp
    Function *PrintfF = dyn_cast<Function>(Printf.getCallee()); 
    PrintfF->setDoesNotThrow();
    PrintfF->addParamAttr(0, Attribute::NoCapture); 
    PrintfF->addParamAttr(0, Attribute::ReadOnly); 

    // STEP 2: Inject a global variable that will hold the printf format string
    // ----------------------------------------------------------------
    // 生成一个 String 的常量
    llvm::Constant *printfFormatStr = llvm::ConstantDataArray::getString(
        CTX, "(llvm-tutor) Hello from: %s\n(llvm-tutor) number of arguments: %d\n"
    ); 
    // 在 Module 里面创建一个空值
    llvm::Constant *printfFormatStrVar = M.getOrInsertGlobal(
        "printfFormatStr", printfFormatStr->getType()
    ); 
    // 把值复制过去 (注意Initializer指等号右边的初始值) 疑问? 为什么只复制指针就够了?  
    dyn_cast<GlobalVariable>(printfFormatStrVar)->setInitializer(printfFormatStr); 

    // STEP 3: For each function in the module, inject a call to printf
    // ----------------------------------------------------------------
    for (auto &F : M){
        if (F.isDeclaration()) continue; // declaration 不会执行，不要插入。

        // Get an IR builder. Sets the insertion point to the top of the function
        // (由于 getFirstInsertionPt 返回的是 iterator, 需要解引用)
        IRBuilder<> Builder(&*F.getEntryBlock().getFirstInsertionPt()); 

        // Inject a global variable that contains the function name
        auto FuncName = Builder.CreateGlobalStringPtr(F.getName());
        // Printf requires i8*, but PrintfFormatStrVar is an array: [n x i8]. Add a cast: [n x i8] -> i8*
        llvm::Value *FormatStrPtr =
            Builder.CreatePointerCast(printfFormatStrVar, PrintfArgTy, "formatStr");
        // The following is visible only if you pass -debug on the command line
        // *and* you have an assert build.
        // LLVM_DEBUG(dbgs() << " Injecting call to printf inside " << F.getName() << "\n");

        // Finally,, inject a call to printf 
        Builder.CreateCall(
            Printf, {FormatStrPtr, FuncName, Builder.getInt32(F.arg_size())});    
        InsertedAtLeastOnePrintf = true;
    }

    return InsertedAtLeastOnePrintf; 
}

//-----------------------------------------------------------------------------
// Legacy PM Registration
//-----------------------------------------------------------------------------
char LegacyInjectFuncCall::ID = 0;
// Register the pass - required for (among others) opt
static RegisterPass<LegacyInjectFuncCall>
    X(/*PassArg=*/"legacy-inject-func-call", /*Name=*/"Legacy Inject FuncCall",
      /*CFGOnly=*/false, /*is_analysis=*/false);