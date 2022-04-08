# From C to Machine Code with LLVM 

![LLVM IR and Go | Gopher Academy Blog](llvm_compiler_pipeline.png)

LLVM may be very useful in the development OS (osdev, the book 「30日でできる! OS自作入門」川合秀実), as it provides a whole toolchain that can compiling C language as well as Assembly Langauge (you can specify whether using Intel syntax or AT&T syntax) 

All notes from ***Compiling LLVM IR*** by Hosein Ghahramanzadeh [Compiling LLVM IR.pdf (sharif.edu)](http://ce.sharif.edu/courses/98-99/1/ce414-1/resources/root/Project/Compiling LLVM IR.pdf)

---

## LLVM IR 

To emit IR code from C code 

```bash
clang -S -emit-llvm HelloWorld.c
```

- `-S` compile to assembly code instead of bytecode 
- `-o`  output path 
- `-O` optimization 
- `-mllvm` pass flags to llvm (clang is a driver, the actual backend things are done by LLVM) 
  - `--x86-asm-syntax=[intel, att]` which assembly language syntax to use. 

It will generate a LLVM assembly code `HelloWorld.ll`  file. 

---

## Choose Target (and Subtarget)

Although OS development is in fact platform-dependent (think about Windows ARM and Windows X86), we still want some ways to do cross-platform compilation 

[Cross-compilation using Clang — Clang 15.0.0git documentation (llvm.org)](https://clang.llvm.org/docs/CrossCompilation.html)

[LLVM Language Reference Manual — LLVM 15.0.0git documentation](https://llvm.org/docs/LangRef.html#target-triple)

But for developing a simple OS, we only need to specify a generic X86 architecture. I put it here because we may want to make an OS for RISC-V later. See [mit-pdos/xv6-riscv: Xv6 for RISC-V (github.com)](https://github.com/mit-pdos/xv6-riscv). 

But now, I know need X86 assembly code 

```bash
clang HelloWorld.ll -S -o HelloWorld.s -O3 -mllvm --x86-asm-syntax=intel
```

Or use LLVM static compiler to generare assembly code (`-m` is the parameter to LLVM and `arch` is used to identify target archiecture). 

```bash
clang HelloWorld.c -O3 -S -emit-llvm -march=x86-64
llc -filetype=asm --x86-asm-syntax=[intel 或者 att] HelloWorld.ll
```

---

## Assembling

To assembling X86 assembly code, you can use `as`, `nasm`

[Linux assemblers: A comparison of GAS and NASM - IBM Developer](https://developer.ibm.com/articles/l-gas-nasm/)

```bash
as HelloWorld.s 
```

or the LLVM static compiler `ll` (but it only support `ll` assembly inputs, it means if you manually write X86 code, you have to run assemblers like `as` or `nasm`). 

[c++ - How to generate machine code with llvm - Stack Overflow](https://stackoverflow.com/questions/13464259/how-to-generate-machine-code-with-llvm)

[llc - LLVM static compiler — LLVM 15.0.0git documentation](https://llvm.org/docs/CommandGuide/llc.html)

```bash
llc -filetype=obj HelloWorld.ll
```

## Linking

The last stop of the journey ! The clang will joint all object files into a single executable. 

```bash
clang HelloWorld.o -o HelloWorld
```

## Objdump

We can also inspect the assembly code. 

```bash
objdump -d a.out
```

