/*
    ONLY for Linux. 

    https://man7.org/linux/man-pages/man2/sched_setaffinity.2.html
    https://man7.org/linux/man-pages/man3/sched_getcpu.3.html
*/

#include <sched.h>
#include <stdio.h>

/* Set the CPU affinity for a task */
extern int sched_setaffinity (__pid_t __pid, size_t __cpusetsize,
			      const cpu_set_t *__cpuset) __THROW;

/* get cpu id */ 
extern int sched_getcpu (void) __THROW;


# define CPU_ZERO(cpusetp)	 __CPU_ZERO_S (sizeof (cpu_set_t), cpusetp)
# define CPU_SET(cpu, cpusetp)	 __CPU_SET_S (cpu, sizeof (cpu_set_t), cpusetp)

int main(){
    int cpu; 
    cpu_set_t cpuset;


    cpu = sched_getcpu(); 
    printf("Running on CPU %d\n", cpu);

    printf("scheduling the current thread to cpu 3...\n"); 
    cpu = 3; 
    CPU_ZERO(&cpuset);
    CPU_SET(cpu, &cpuset);
    sched_setaffinity(0, sizeof(cpuset), &cpuset);

    cpu = sched_getcpu(); 
    printf("Running on CPU %d\n", cpu);
}

