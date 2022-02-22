# LLVM Hello World Backend Pass 

In `lib/Target/X86/` directory, create a pass `X86MachineCountPass.cpp` (the header file is optional, but if it is an analysis pass, it can be used by other passes if there is a header file). 

```cpp
#include "X86.h"
#include "llvm/Pass.h"
#include "llvm/CodeGen/MachineBasicBlock.h"
#include "llvm/CodeGen/MachineFunction.h"
#include "llvm/CodeGen/MachineFunctionPass.h"
#include "llvm/Support/raw_ostream.h"
using namespace llvm;

namespace {
class MachineCountPass : public MachineFunctionPass {
public:
  static char ID;
  MachineCountPass() : MachineFunctionPass(ID) {}
  virtual bool runOnMachineFunction(MachineFunction &MF) {
    unsigned num_instr = 0;
    for (MachineFunction::const_iterator I = MF.begin(), E = MF.end(); I != E; ++I) {
      for (MachineBasicBlock::const_iterator BBI = I->begin(),
                                             BBE = I->end(); BBI != BBE; ++BBI) {
        ++num_instr;
      } }
    errs() << "mcount --- " << MF.getName() << " has "
           << num_instr << " instructions.\n";
    return false;
  }
};
}

FunctionPass *llvm::createMyCustomMachinePass() {
  return new MachineCountPass();
}

char MachineCountPass::ID = 0;
   static RegisterPass<MachineCountPass> X("machinecount", "Machine CountPass");
```

And tell the build system in `lib/Target/X86/CMakeLists.txt`, there is a new pass 

```cmake
set(sources
  X86AsmPrinter.cpp
	... 
  X86MachineCountPass.cpp # the new pass 
  )
```

Choose a position to insert your new pass (***create an instance*** in `lib/Target/X86/X86TargetMachine.cpp`)

```cpp
void X86PassConfig::addPreEmitPass() {
  ... 
  // create an new instance of pass in prior of emiting code. 
  addPass(createMyCustomMachinePass()); 
}
```

Finally, declare the function interface in `lib/Target/X86/X86.h`  for linking 

```cpp
FunctionPass *createMyCustomMachinePass(); // the new pass interface.
```

To see the final outcome, build the new LLVM 

see the blog here [LLVM安装 (haohua-li.github.io)](https://haohua-li.github.io/2022/01/18/llvm-installation.html)

(assume the llvm has been built, hence, you don't have to enable any subprojects). 

I do the testing in my git clone (`~` is the user home directory). 

```bash
cd ~/llvm-project/llvm 
mkdir build && cd build

# build the LLVM alone 
# 	(without building other subprojects... specify compiler and system SDK(the SDK depends on the system version))
CC=/usr/local/bin/clang CXX=/usr/local/bin/clang++ SDKROOT=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX12.1.sdk cmake ../llvm -G Ninja -DCMAKE_BUILD_TYPE="Release"

# build (use all cores in the laptop). 
cmake --build . -j $(nproc)
```

To see if llvm works properly 

```bash
# don't install this llvm, otherwises, it will pollute the original llvm. 
~/llvm-project/llvm/build/llc 
```

Or create a Clion CMake profile and then ***Build -> Build Project*** to debug the LLVM. 

![image-20220222113345129](https://raw.githubusercontent.com/haohua-li/photo-asset-repo/main/imgs/image-20220222113345129.png)

Test if the llvm works properly 

```bash
~/llvm-project/llvm/cmake-build-release/llc --version 
```







