# SIMD for C++

## 参考资料

- Computer Organization and Design The Hardware Software Interface (RISC-V Edition) 
  - Chapter 3.7 
  - Chapter 6 
- [费林分类法 - 维基百科，自由的百科全书 (wikipedia.org)](https://zh.wikipedia.org/wiki/費林分類法)
- https://sites.cs.ucsb.edu/~tyang/class/240a17/slides/SIMD.pdf
- [Intrinsic function - Wikipedia](https://en.wikipedia.org/wiki/Intrinsic_function)
- [SIMD/Overview - MozillaWiki](https://wiki.mozilla.org/SIMD/Overview)
- https://ark.intel.com/content/www/us/en/ark/products/191045/intel-core-i79750h-processor-12m-cache-up-to-4-50-ghz.html 
- [ermig1979/Simd: C++ image processing and machine learning library with using of SIMD: SSE, AVX, AVX-512 for x86/x64, VMX(Altivec) and VSX(Power7) for PowerPC, NEON for ARM. (github.com)](https://github.com/ermig1979/Simd)
- [mendlin/SIMD-libgen: This is a toolkit called IDISA+ which could automatically generate SIMD libraries for SSE2/SSE3/SSSE3/SSE4.1/SSE4.2/AVX/NEON platforms. (github.com)](https://github.com/mendlin/SIMD-libgen)
- [CourSys - SIMD Code Generation in the LLVM Back-End (sfu.ca)](https://coursys.sfu.ca/2018sp-cmpt-489-x1/pages/BackEndSIMD)

## Flynn's Taxonomy

[Harvard architecture - Wikipedia](https://en.wikipedia.org/wiki/Harvard_architecture)

[费林分类法 - 维基百科，自由的百科全书 (wikipedia.org)](https://zh.wikipedia.org/wiki/費林分類法)

While modern computer systems are mostly based on Von Neumann architecture, Harvard architecture contrasts it by **distinguishing the instruction and data.** 

The Flynn's taxonomy is yet another classification of computer architectures, which may describe whether the computer will support vectorization and parallelism. 

**Instruction Pool**: a collection of instructions. 

**Data Pool**: a colletion of data streams.

Notice the difference between parallelism (并行) and concurrency (并发). 

<img src="image-20220220151736850.png" alt="image-20220220151736850" style="zoom: 33%;" />

### Cheatsheet

- [x64_cheatsheet.pdf (brown.edu)](https://cs.brown.edu/courses/cs033/docs/guides/x64_cheatsheet.pdf)
- [LLVM Language Reference Manual — LLVM 15.0.0git documentation](https://llvm.org/docs/LangRef.html)
- [RISC-V Assembly Language (utk.edu)](https://web.eecs.utk.edu/~smarz1/courses/ece356/notes/assembly/)
- [RISCV_CARD.pdf (sfu.ca)](https://www.cs.sfu.ca/~ashriram/Courses/CS295/assets/notebooks/RISCV/RISCV_CARD.pdf)

### 如何查看是否支持 SIMD

查看 CPU 型号

```bash
sysctl -n machdep.cpu.brand_string
```

[Intel Ark](https://ark.intel.com) 可以查到所有 Product Specifications 。

比如 macbook pro 2019 款在 https://ark.intel.com/content/www/us/en/ark/products/191045/intel-core-i79750h-processor-12m-cache-up-to-4-50-ghz.html 

![image-20220220152348881](image-20220220152348881.png)

在 Instruction Set  那一栏可以看到 

- Instruction Set : 
  - An instruction set refers to **the basic set of commands and instructions that a microprocessor understands** and can carry out. 
- Instruction Set Extensions: 
  - Instruction Set Extensions are additional instructions which can increase performance when the same operations are **performed on multiple data objects**. These can include **SSE (Streaming SIMD Extensions)** and **AVX (Advanced Vector Extensions)**.
  - [SSE](http://en.wikipedia.org/wiki/Sse2): Available on every not completely outdated CPU from Intel, AMD, or VIA. The SSE2 instructions are guaranteed to be available on all 64-bit x86-CPUs („x86-64“).
    - eight 128-bit registers, XMM0, XMM1, XMM2, XMM3, ... 
  - [AVX](http://en.wikipedia.org/wiki/Advanced_Vector_Extensions): Available on modern high-performance CPUs from Intel and AMD.
    - In 2011, Intel enlarged the width of the registers, called YMM, in AVX (advanced vector extensions) .The YMM now is 256-bit instead of 128-bit (more floating-point operations)
    - To support legacy SSE instructions, the lower 128 bits of the YMM registers would be used as XMM. 
    - From SEE2 to AVX, prepend `v` and use YMM instead of XMM
      - SEE `addpd %xmm0,%xmm4`  (SEE addition on registers `xmm0` and `xmm4` with packed `double` data)
      - AVX `vaddpd %ymm0, %ymm4` (AVX addition on registers `ymm0` and `ymm4` with packed `double` data)
    - AVX 512 bits `zmm`, 1024 bits in the later x86 architecture..... 
  - Three and four address instructions 
    - Three address in AVX: `vaddpd %ymm0, %ymm1, %ymm4` 
      - `%ymm4 = %ymm0 + %ymm1`   
    - Four address in SEE:  `addpd %xmm0, %xmm4`
      - `%xmm4 = %xmm4 + %xmm0` (add source to destination) 
    - *Three address instrucions* are common in LLVM IR, but the arrangment is a bit different from X86 instruction set 
      - [LLVM IR](https://llvm.org/docs/LangRef.html) `<add4> = add <ty> <add0> <add1>` 
      - [RISC-V](https://web.eecs.utk.edu/~smarz1/courses/ece356/notes/assembly/) `add <add4> <add0> <add1>` 
      - X86 AVX  `vaddpd %ymm0, %ymm1, %ymm4 ` 

### SEE2 Extended Instructions

A few extended instructions are in SEE2 CPU. 

![image-20220220174740701](image-20220220174740701.png)

From the book *Computer Organization and Design The Hardware Software Interface (RISC-V Edition)* by David A. Patterson and John L. Hennessy. 

The vector instructions are for **load/store**, **calculation** and **comparision**.   

### Scalar Data

one operand in a normal/wider register. 

- one 32-bit operand in a 128-bit SEE register 
- one 64-bit operand in a 128-bit SEE register 

> ***TODO***: 
>
> - [ ] 疑问 -> Scalar data 的内存需要对齐吗???? 

### Packed Data 

[SIMD/Overview - MozillaWiki](https://wiki.mozilla.org/SIMD/Overview)

In x64 architecture, there are sixteen **64-bit (or 8-byte) regsiters**. 

But SIMD usually works with **wider registers (e.g. 128-bit, 256-bit.. )** and SIMD can pack multiple data streams into a single data stream. A typical 128 bit SIMD register can contain...

> If the operands can be arranged in memory ***as 128-bit aligned data***, then ***128-bit data transfers can load and store multiple operands per instruction.***
>
> ___from the book Chapter 3.7 *Computer Organization and Design: the hardware and software interface (RISCV edition)*

![image-20220220161627501](image-20220220161627501.png)

(single precision floating point number 32 bit, double precision floating point number 64 bit). 

The vectorized instructions add and multiply are shown below 

![image-20220220161904345](image-20220220161904345.png)



There is a natural connecttion between **LLVM IR** and SIMD registers. 

[CourSys - SIMD Code Generation in the LLVM Back-End (sfu.ca)](https://coursys.sfu.ca/2018sp-cmpt-489-x1/pages/BackEndSIMD)

For example, `<4 x i32>` is the llvm vector type for a four 32-bit integers treated as a single (128-bit) value.

### Intrinsics

Intrinsics are C functions and procedures for ***inserting assembly language into C code***, including SSE instructions. 

[Header files for x86 SIMD intrinsics - Stack Overflow](https://stackoverflow.com/questions/11228855/header-files-for-x86-simd-intrinsics)

> These days you should normally just include `<immintrin.h>`. It includes everything.

```cpp
#include <mmintrin.h>  // MMX
#include <xmmintrin.h> // SSE
#include <emmintrin.h> // SSE2
#include <pmmintrin.h> // SSE3
#include <tmmintrin.h> // SSSE3
#incldue <smmintrin.h> // SSE4.1
#include <nmmintrin.h> // SSE4.2
#include <ammintrin.h> // SSE4A
#include <wmmintrin.h> // AES
// ----------------------------------------------
#include <immintrin.h> // AVX, AVX2, FMA (note that AVX is compatible to SEE). 
```

The **intrinsic** development guide in Intel: 
https://www.intel.com/content/www/us/en/docs/intrinsics-guide/index.html

(这个 Intel 手册还挺漂亮的)。

[How to Write Fast Numerical Code (ethz.ch)](https://acl.inf.ethz.ch/teaching/fastcode/2021/slides/07-simd-avx.pdf)



## 小作业 Homeworks 

[Shuffle the Array - LeetCode](https://leetcode.com/problems/shuffle-the-array/)

[Kids With the Greatest Number of Candies - LeetCode](https://leetcode.com/problems/kids-with-the-greatest-number-of-candies/)

[Minimum Number of People to Teach - LeetCode](https://leetcode.com/problems/minimum-number-of-people-to-teach/)

[Median of Two Sorted Arrays - LeetCode](https://leetcode.com/problems/median-of-two-sorted-arrays/)

[Simple Matrix](./simple_matrix/)  



## 大作业 Assignments 

[Image Processing - adjusting contrast of an image](./image-contrast/README.md)
