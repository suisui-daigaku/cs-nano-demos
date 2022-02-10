This directory includes all source code that will be optmized. 

## OpcodeCounter
参考 https://github.com/banach-space/llvm-tutor#opcodecounter

```bash
clang -o1 -emit-llvm -c ./Examples/example_for_cc.c -o ./Examples/example_for_cc.bc


opt -enable-new-pm=0 -load ./build/lib/libOpcodeCounter.dylib -legacy-opcode-counter -analyze ./Examples/example_for_cc.bc
```

为了和 `ll` 文件比较，可以编译成 `ll` 文件
```bash
clang -o1 -emit-llvm -S ./Examples/example_for_cc.c -o ./Examples/example_for_cc.ll
```