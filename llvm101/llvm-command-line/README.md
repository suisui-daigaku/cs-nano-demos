# LLVM CommandLine Example 

### Install the LLVM

```
brew install llvm
```

### Build the Project 

Build the project 

```
mkdir build && cd build 
cmake ..
make 
```

### Use the Plugin 

Use the `opt` tool to run 

(CommandLine is still a part of legacy pass manager, so we need to keep the old load style). 

```bash 
opt -O0 -load build/libHelloWorld.dylib -load-pass-plugin=build/libHelloWorld.dylib -disable-output -lists ARG1 -lists ARG2 test.ll
```

Use the `clang` tool to run 

```bash 
clang -Xclang -load -Xclang build/libHelloWorld.dylib -mllvm -lists -mllvm ARG1 -mllvm -lists -mllvm ARG2 -fpass-plugin=build/libHelloWorld.dylib test.c
```

