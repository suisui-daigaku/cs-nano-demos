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
    printf("[[ %s ]]: running on cpu %d \n", (char*) args, sched_getcpu());
}

int main(){

    char *message1 = "Thread 1";
    char *message2 = "Thread 2";
    pthread_t th1;
    pthread_t th2;
    int ret1;
    int ret2;
    
    // create a cpu set with core 1
    pthread_attr_t tattr1;
    pthread_attr_init(&tattr1); 
    cpu_set_t cpuset_1;
    CPU_ZERO(&cpuset_1);
    CPU_SET(1, &cpuset_1);
    pthread_attr_setaffinity_np(&tattr1, sizeof(cpuset_1), &cpuset_1); 
    
    // create a cpu set with core 2
    pthread_attr_t tattr2;
    pthread_attr_init(&tattr2); 
    cpu_set_t cpuset_2;
    CPU_ZERO(&cpuset_2);
    CPU_SET(2, &cpuset_2);
    pthread_attr_setaffinity_np(&tattr2, sizeof(cpuset_2), &cpuset_2); 

    /* initialize threads */
    ret1 = pthread_create(&th1, &tattr1, cpu_intensive_function, (void*) message1);
    ret2 = pthread_create(&th2, &tattr2, cpu_intensive_function, (void*) message2);
    
    // wait for the threads to terminate.
    pthread_join(th1, NULL);
    pthread_join(th2, NULL);

    return 0;
}