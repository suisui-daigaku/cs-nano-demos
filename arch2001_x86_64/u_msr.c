#include <signal.h>
#include <stdio.h>
#include <stdint.h> 


static inline uint64_t __rdmsr(uint64_t msr){
	uint32_t low, high;
	__asm__ __volatile__ (
		"rdmsr"
		: "=a"(low), "=d"(high)
		: "c"(msr)
	);
	return ((uint64_t)high << 32) | low;
}


void signal_handler(int signo){
    printf("[ERROR-HANDLER] Caught the signal, will handle it now\n");
    
}

int main(void){
    signal(SIGILL, signal_handler);
    
    uint64_t out = __rdmsr(0xC0000080);
    printf("IA32_EFER = 0x%016llx\n", out);  
    if ((out >> 8) & 1) printf("IA32_EFER.LME = 1 \n"); 
    if ((out >> 10) & 1) printf("IA32_EFER.LMA = 1 \n"); 
    
    printf(" ~(^-^)~ : end of program. \n"); 
    return 0;
}