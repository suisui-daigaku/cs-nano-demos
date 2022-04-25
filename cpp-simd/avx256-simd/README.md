# SIMD 

Three ways to vectorize the code 

[AVX512 (2 of 3): Programming AVX512 in 3 Different Ways - YouTube](https://www.youtube.com/watch?v=I3efQKLgsjM)

[AVX512 (3 of 3): Deep Dive into AVX512 Mechanisms - YouTube](https://www.youtube.com/watch?v=543a1b-cPmU)

---

- Agner Fog’s VCL github https://github.com/vectorclass/version2 
- Intrinsic function 
  - [x86 intrinsics list | Microsoft Docs](https://docs.microsoft.com/en-us/cpp/intrinsics/x86-intrinsics-list?view=msvc-170)
  - [Intel® Intrinsics Guide](https://www.intel.com/content/www/us/en/docs/intrinsics-guide/index.html)
  - [x86/x64 SIMD命令一覧表　（SSE～AVX512） (officedaytime.com)](https://www.officedaytime.com/simd512/)
  - [x86-intrin-cheatsheet-v2.2.pdf (tum.de)](https://db.in.tum.de/~finis/x86-intrin-cheatsheet-v2.2.pdf)
  - [酷站推荐 - officedaytime.com - x86/x64 SIMD SSE-AVX512 - 知乎 (zhihu.com)](https://zhuanlan.zhihu.com/p/338277575)
- Assembly Language 
  - [AVX512 (2 of 3): Programming AVX512 in 3 Different Ways - YouTube](https://www.youtube.com/watch?v=I3efQKLgsjM)

熟悉的人应该都知道 Agner Fog 是谁

> The intrin.h header includes both immintrin.h and ammintrin.h for simplicity.
>
> https://docs.microsoft.com/en-us/cpp/intrinsics/x86-intrinsics-list?view=msvc-170

---

## Naming and Usage Syntax

[Overview: Intrinsics for Intel® Advanced Vector Extensions 512 (Intel® AVX-512) Instructions (ufrj.br)](http://portal.nacad.ufrj.br/online/intel/compiler_c/common/core/GUID-D77C7B04-9104-4AFE-A29B-005683AC9F78.htm)

`<suffix>` 数据类型

> The Intel® AVX-512 intrinsic functions use three C data types as operands, representing the new registers used as operands to the intrinsic functions. 
>
> These are `__m512`, `__m512d`, and `__m512i` data types. The `__m512` data type is used to represent the contents of the extended SSE register, the ZMM register, used by the Intel® AVX-512 intrinsics. 
>
> The `__m512` data type can hold sixteen 32-bit floating-point values. 
>
> The `__m512d` data type can hold eight 64-bit double precision floating-point values. 
>
> The `__m512i` data type can hold sixty-four 8-bit, thirty-two 16-bit, sixteen 32-bit, or eight 64-bit integer values.
>
> The compiler aligns the `__m512`, `__m512d`, and `__m512i` local and global data to 64-byte boundaries on the stack. To align integer, float, or double arrays, use the `__declspec(align)` statement.
