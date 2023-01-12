#define _XOPEN_SOURCE

#include <stdio.h>
#include <string.h>
#include <signal.h>
#include <stdlib.h> 
#include <ucontext.h>

#define WRFSBASE_LEN 5

static void sigill_handler(int sig, siginfo_t* si, void* data){
    // <https://stackoverflow.com/questions/14233464/can-a-c-program-continue-execution-after-a-signal-is-handled>
    // <https://github.com/hibana-enclave/sgx-lkl/blob/oe_port/src/main-oe/sgxlkl_run_oe.c#L880>
    ucontext_t* uc = (ucontext_t*) data;
    printf("[[ signal handler ]]: Illegal instruction handler is here! skip the illegal instrucion to avoid infinite loop \n"); 
    printf("[[ signal handler ]]: Caught SIGSEGV, addr %p, RIP 0x%llx\n", si->si_addr, uc->uc_mcontext->__ss.__rip); 
#ifdef __APPLE__
    uc->uc_mcontext->__ss.__rip += WRFSBASE_LEN;
#elif __linux__
    uc->uc_mcontext.gregs[REG_RIP] += RDFSBASE_LEN;
#else
    printf("making support for Windows is a nightmare ...\n"); 
    exit(1); 
#endif
}

int main(void){
    struct sigaction sa;
    memset(&sa, 0, sizeof(struct sigaction));
    sa.sa_flags = SA_SIGINFO;
    sa.sa_sigaction = sigill_handler;
    if (sigaction(SIGILL, &sa, NULL) == -1){
        printf("[ERROR] registeration of sigill handler is failed.\n"); 
        exit(1); 
    }
    __asm__ __inline__(
        "wrfsbase %rax\t\n"
    );
    printf("Congradulations!\n"); 
    return 0;
}

