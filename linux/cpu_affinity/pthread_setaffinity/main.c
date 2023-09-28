#define _GNU_SOURCE
#include <stdio.h>
#include <pthread.h>
#include <stdlib.h>
#include <sched.h>
#include <errno.h>
#include <math.h>


#define handle_error_en(en, msg)\
    do { errno = en; perror(msg); exit(EXIT_FAILURE);} while (0);

void *cpu_intensive_function(void *args){
    float x = 1.5f;
    while (1)
    {
        x *= sin(x) / atan(x) * tanh(x) * sqrt(x);
    }
}

int main(){

    // create a cpu set with core 1
    cpu_set_t cpuset_1;
    CPU_ZERO(&cpuset_1);
    CPU_SET(1, &cpuset_1);
    
    // create a cpu set with core 2
    cpu_set_t cpuset_2;
    CPU_ZERO(&cpuset_2);
    CPU_SET(2, &cpuset_2);
    
    pthread_t th1;
    pthread_t th2;
    int ret1;
    int ret2;
    
    /* initialize threads */
    ret1 = pthread_create(&th1, NULL, cpu_intensive_function, NULL);
    ret2 = pthread_create(&th2, NULL, cpu_intensive_function, NULL);
    
    /* Set the affinity to thread 1*/
    int s1 = pthread_setaffinity_np(th1, sizeof(cpu_set_t), &cpuset_1);
    if (s1 != 0)
        handle_error_en(s1, "pthread_set_affinity_np, s1");
    
    /*set the affinity to thread 2*/
    int s2 = pthread_setaffinity_np(th2, sizeof(cpu_set_t), &cpuset_2);
    if (s2 != 0)
        handle_error_en(s2, "pthread_set_affinity_np, s2");
    
    // wait for the threads to terminate.
    pthread_join(th1, NULL);
    pthread_join(th2, NULL);

    return 0;
}