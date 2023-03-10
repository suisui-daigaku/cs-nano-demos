#include <stdio.h>


/*
    CPUID、SGX中使用CPUID 小气球归来 
        https://blog.csdn.net/clh14281055/article/details/107924831
    
    Intel® 64 and IA-32 Architectures Software Developer Manuals
        https://www.intel.com/content/www/us/en/developer/articles/technical/intel-sdm.html
*/
int main(){
    unsigned int EAX, EBX, ECX, EDX; 
    __asm__ __volatile__(
        "cpuid\n" 
        : "=a"(EAX), "=b"(EBX), "=c"(ECX), "=d"(EDX)
        : "a" (0x7), "c"(0));
    // EAX = 0x7H (high)

    printf("%x\n", EBX); 
    
    if ((EBX >> 2) & 1){
        printf("SGX supported.\n"); 
    }else{
        printf("SGX is not available.\n"); 
    }
}