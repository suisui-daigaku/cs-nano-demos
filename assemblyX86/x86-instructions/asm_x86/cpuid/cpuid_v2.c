#include <stdio.h>


/* https://gist.github.com/bl4ck5un/31ad94ee95aa2d9460f8a375864315f2 */

static inline void native_cpuid(unsigned int *eax, unsigned int *ebx,
                                unsigned int *ecx, unsigned int *edx)
{
        /* ecx is often an input as well as an output. */
        asm volatile("cpuid"
            : "=a" (*eax),
              "=b" (*ebx),
              "=c" (*ecx),
              "=d" (*edx)
            : "0" (*eax), "2" (*ecx));
}

int main(){
    unsigned eax, ebx, ecx, edx;
    /* Extended feature bits (EAX=07H, ECX=0H)*/
    printf("\nExtended feature bits (EAX=07H, ECX=0H)\n");
    eax = 7;
    ecx = 0;
    native_cpuid(&eax, &ebx, &ecx, &edx);
    printf("eax: %x ebx: %x ecx: %x edx: %x\n", eax, ebx, ecx, edx);
    //CPUID.(EAX=07H, ECX=0H):EBX.SGX = 1,
    printf("SGX available: %d\n", (ebx >> 2) & 0x1);
}