

#include <stdio.h>


int support_avx(){
    unsigned int EAX, EBX, ECX, EDX; 
    __asm__ __volatile__(
        "cpuid\n" 
        : "=a"(EAX), "=b"(EBX), "=c"(ECX), "=d"(EDX)
        : "a" (1), "c"(0));
    if ((ECX >> 28) & 1) return 1;
    return 0; 
}



int main(){
    if (support_avx()){
        printf("AVX\n"); 
    }else{
        printf("SSE\n"); 
    }
    return 0; 
}