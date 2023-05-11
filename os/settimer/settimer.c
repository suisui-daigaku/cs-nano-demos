#include <sys/time.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <signal.h>


#define SGX_STEP_ATTACK_RANDOM_LOW_USEC  9000 
#define SGX_STEP_ATTACK_RANDOM_HIGH_USEC 9000

void sgx_step_attack_signal_timer_handler(int signum){
    printf("hello world from handler\n"); 
    exit(0); 
}



int main(){
    unsigned int attack_timer_range = SGX_STEP_ATTACK_RANDOM_HIGH_USEC - SGX_STEP_ATTACK_RANDOM_LOW_USEC + 1; 
    // srand(time(NULL)); 
    unsigned int attack_timer_delay = SGX_STEP_ATTACK_RANDOM_LOW_USEC + rand() % attack_timer_range; 
    printf("[[ SGX-STEP ]] The host will trigger the SGX-STEP APIC attack in %.6lf second \n", attack_timer_delay / 1000.0); 
    /* Install timer_handler as the signal handler for SIGVTALRM */
    struct sigaction sa; 
    struct itimerval timer; 
    memset(&sa, 0, sizeof(sa));
    sigemptyset(&sa.sa_mask); 
    sa.sa_handler = &sgx_step_attack_signal_timer_handler; 
    sigaction(SIGALRM, &sa, NULL);   
    /* configure the timer to expire after attack_timer_delay mircosec... */
    timer.it_value.tv_sec = attack_timer_delay / 1000;
    timer.it_value.tv_usec = attack_timer_delay % 1000;
    timer.it_interval.tv_sec = 0; 
    timer.it_interval.tv_usec = 0; 
    /* start a virtual timer */
    setitimer(ITIMER_REAL, &timer, NULL); 

    // while(1);




}


