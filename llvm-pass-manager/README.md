# Pass Manager Hello World 

[CSCD70/Tutorial2-Introduction_to_LLVM_ii/Example2-Pass_Manager at 2021S · UofT-EcoSystem/CSCD70 (github.com)](https://github.com/UofT-EcoSystem/CSCD70/tree/2021S/Tutorial2-Introduction_to_LLVM_ii/Example2-Pass_Manager)

## Objective

- Learn **Require** and **Preserve** in the pass manager 

## Build 

```bash
mkdir build & cd build 

CC=/usr/local/bin/clang;CXX=/usr/local/bin/clang++;SDKROOT=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX12.1.sdk cmake -DLT_LLVM_INSTALL_DIR="/usr/local" ..

make
```

## Run 

Transformation `Transform.cpp`

```bash
opt --enable-new-pm=0 -load ./build/lib/libPassManagerHelloWorld.dylib -transform -o example_for_call_count.bin example_for_call_count.ll
```

AnotherTransform `AnotherTransform.cpp`

```bash
opt --enable-new-pm=0 -load ./build/lib/libPassManagerHelloWorld.dylib -another-transform -o example_for_call_count.bin example_for_call_count.ll
```

