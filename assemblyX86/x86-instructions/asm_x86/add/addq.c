#include <stdio.h>

long long ssa_loc = -1; 

int main(){
    __asm__ __volatile__(
        "addq $0, _ssa_loc(%rip)" // Add imm32 sign-extended to 64-bits to r/m64.
    ); 
    printf("%lld\n", ssa_loc); 
}
