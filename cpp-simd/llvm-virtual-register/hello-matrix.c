/****************************************************************************
 * Hello Matrix 2x2 
 *      https://sites.cs.ucsb.edu/~tyang/class/240a17/slides/SIMD.pdf 
****************************************************************************/

#include <stdio.h>
#include <immintrin.h> // AVX, AVX2, FMA

int main(int argc, char *argv[]){
    // allocate A, B, C aligned on 16-byte boundaries 
    __attribute__((aligned(16))) double A[4]; 
    __attribute__((aligned(16))) double B[4];
    __attribute__((aligned(16))) double C[4];

    const int N = 2; 
    const int M = 2; 
    int i = 0; 
    __m128d c1, c2, a, b1, b2; 

    // a = [1, 0; 0, 1]
    A[0] = 1.0; A[1] = 0.0; A[2] = 0.0; A[3] = 1.0; 
    // b = [1, 3; 2, 4]
    B[0] = 1.0; B[1] = 2.0; B[2] = 3.0; B[3] = 4.0; 
    // c = [0, 0; 0, 0] 
    C[0] = 0.0; C[1] = 0.0; C[2] = 0.0; C[3] = 0.0; 

    // use SSE instruction (xmm) 
    c1 = _mm_load_pd(C+0*N); 
    c2 = _mm_load_pd(C+1*N); 

    for (i = 0; i < M; i++){
        a = _mm_load_pd(A+i*N); 
        b1 = _mm_load1_pd(B+i+0*N); 
        b2 = _mm_load1_pd(B+i+1*N); 
        c1 = _mm_add_pd(c1, _mm_mul_pd(a, b1)); 
        c2 = _mm_add_pd(c2, _mm_mul_pd(a, b2)); 
    }

    _mm_store_pd(C+0*N, c1); 
    _mm_store_pd(C+1*N, c2); 

    printf("%g, %g\n%g, %g\n", C[0], C[2], C[1], C[3]); 

    return 0; 
}