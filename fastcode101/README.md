# Advanced Systems Lab

[Advanced Systems Lab - Spring 2021 (ethz.ch)](https://acl.inf.ethz.ch/teaching/fastcode/2021/)

| Homework                                                     | Deadline            | Solution                                                     |
| :----------------------------------------------------------- | :------------------ | :----------------------------------------------------------- |
| [Homework 0](https://acl.inf.ethz.ch/teaching/fastcode/2021/homeworks/hw0/hw00.pdf) | as soon as possible |                                                              |
| [Homework 1](https://acl.inf.ethz.ch/teaching/fastcode/2021/homeworks/hw1/hw01.pdf) | Th March 11th, 5pm  | [Homework 1](https://acl.inf.ethz.ch/teaching/fastcode/2021/homeworks/hw1/hw01_sol.pdf) |
| [Homework 2](https://acl.inf.ethz.ch/teaching/fastcode/2021/homeworks/hw2/hw02.pdf) | Th March 18th, 5pm  | [Homework 2](https://acl.inf.ethz.ch/teaching/fastcode/2021/homeworks/hw2/hw02_sol.pdf) |
| [Homework 3](https://acl.inf.ethz.ch/teaching/fastcode/2021/homeworks/hw3/hw03.pdf) | Th April 1st, 5pm   | programming exercise auto-assessed                           |
| [Homework 4](https://acl.inf.ethz.ch/teaching/fastcode/2021/homeworks/hw4/hw04.pdf) | Sa April 17th, 5pm  | [Homework 4](https://acl.inf.ethz.ch/teaching/fastcode/2021/homeworks/hw4/hw04_sol.pdf) |

# Lectures Plan

| Date  | Content                                                      | Other Material                                               |
| :---- | :----------------------------------------------------------- | :----------------------------------------------------------- |
| 22.02 | [Course motivation, overview, organization](https://acl.inf.ethz.ch/teaching/fastcode/2021/slides/01-overview-organization.pdf) |                                                              |
| 25.02 | [Cost analysis and performance](https://acl.inf.ethz.ch/teaching/fastcode/2021/slides/02-cost-performance.pdf) |                                                              |
| 01.03 | [Intel Haswell architecture/microarchitecture, operational intensity](https://acl.inf.ethz.ch/teaching/fastcode/2021/slides/03-architecture-core.pdf) | [Intel optimization manual, Section 2.2](http://www.intel.com/content/dam/www/public/us/en/documents/manuals/64-ia-32-architectures-optimization-manual.pdf) |
| 04.03 | [Instruction level parallelism](https://acl.inf.ethz.ch/teaching/fastcode/2021/slides/04-ILP.pdf) |                                                              |
| 08.03 | [Compiler limitations](https://acl.inf.ethz.ch/teaching/fastcode/2021/slides/05-compiler-limitations.pdf), [benchmarking](https://acl.inf.ethz.ch/teaching/fastcode/2021/slides/06-benchmarking.pdf) |                                                              |
| 11.03 | [SIMD vector instructions, AVX](https://acl.inf.ethz.ch/teaching/fastcode/2021/slides/07-simd-avx.pdf) | [Intel intrinsics guide](http://software.intel.com/sites/landingpage/IntrinsicsGuide/), [Agner Fog’s instruction tables](http://www.agner.org/optimize/instruction_tables.pdf), see also the recent [uops](http://uops.info/index.html) |
| 15.03 | SIMD vector instructions, AVX                                |                                                              |
| 18.03 | Compiler vectorization                                       |                                                              |
| 22.03 | [Locality, caches](https://acl.inf.ethz.ch/teaching/fastcode/2021/slides/08-locality-caches.pdf) |                                                              |
| 25.03 | Caches, blocking MMM                                         |                                                              |
| 29.03 | [Roofline model](https://acl.inf.ethz.ch/teaching/fastcode/2021/slides/09-roofline.pdf), [Linear algebra libraries, BLAS, ATLAS](https://acl.inf.ethz.ch/teaching/fastcode/2021/slides/10-linear-algebra-MMM.pdf) |                                                              |
| 01.04 | Fast MMM                                                     |                                                              |
| 12.04 | Fast MMM continued, register renaming, virtual memory        |                                                              |
| 15.04 | [Sparse linear algebra, sparse MVM](https://acl.inf.ethz.ch/teaching/fastcode/2021/slides/11-sparse.pdf) |                                                              |
| 19.04 | [Discrete/fast Fourier transform](https://acl.inf.ethz.ch/teaching/fastcode/2021/slides/12-transforms.pdf) |                                                              |
| 26.04 | [Fast FFT, FFTW](https://acl.inf.ethz.ch/teaching/fastcode/2021/slides/13-fftw.pdf) |                                                              |
| 10.05 | [Spiral: DSL-based program generation for performance](https://acl.inf.ethz.ch/teaching/fastcode/2021/slides/14-spiral.pdf) |                                                              |