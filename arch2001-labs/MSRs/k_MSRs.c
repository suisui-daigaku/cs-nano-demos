#include <signal.h>
#include <stdio.h>
#include <stdint.h> 

/* 
    https://github.com/Xilinx/xen/blob/master/xen/include/asm-x86/msr.h 
*/
static inline uint64_t __rdmsr(uint64_t msr){
	uint32_t low, high;
    // read MSR specified by ECX into EDX:EAX
	__asm__ __volatile__ (
		"rdmsr"
		: "=a"(low), "=d"(high)
		: "c"(msr)
	);
	return ((uint64_t)high << 32) | low;
}

/*
    
*/

int main(void){
    uint64_t out = __rdmsr(0xC0000080);
    printf("IA32_EFER = 0x%016llx\n", out);  
    if ((out >> 8) & 1) printf("IA32_EFER.LME = 1 \n"); 
    if ((out >> 10) & 1) printf("IA32_EFER.LMA = 1 \n"); 
    printf(" ~(^-^)~ : end of program. \n"); 
    return 0;
}

