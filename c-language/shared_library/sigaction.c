#ifdef __APPLE__
#define _XOPEN_SOURCE
#else
#define _GNU_SOURCE
#endif

#include <stdio.h>
#include <string.h>
#include <signal.h>
#include <stdlib.h> 
#include <ucontext.h>

#define MEMACCINST_LEN 6

static void sigill_handler(int sig, siginfo_t* si, void* data){
    // <https://stackoverflow.com/questions/14233464/can-a-c-program-continue-execution-after-a-signal-is-handled>
    // <https://github.com/hibana-enclave/sgx-lkl/blob/oe_port/src/main-oe/sgxlkl_run_oe.c#L880>
    ucontext_t* uc = (ucontext_t*) data;
    printf("[[ signal handler ]]: Illegal instruction handler is here! skip the illegal instrucion to avoid infinite loop \n"); 
    printf("[[ signal handler ]]: Caught SIGSEGV, addr %p, RIP 0x%llx\n", si->si_addr, uc->uc_mcontext->__ss.__rip); 
#ifdef __APPLE__
    uc->uc_mcontext->__ss.__rip += MEMACCINST_LEN;
#else
    uc->uc_mcontext.gregs[REG_RIP] += MEMACCINST_LEN;
#endif
}

int main(void){
    struct sigaction sa;
    memset(&sa, 0, sizeof(struct sigaction));
    sa.sa_flags = SA_SIGINFO;
    sa.sa_sigaction = sigill_handler;
    if (sigaction(SIGSEGV, &sa, NULL) == -1){
        printf("[ERROR] registeration of sigill handler is failed.\n"); 
        exit(1); 
    }

    *(int *)NULL = 0;
    printf("Congradulations!\n"); 
    return 0;
}

