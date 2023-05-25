/*
    ONLY for Linux. 

    https://man7.org/linux/man-pages/man2/sched_setaffinity.2.html
    https://man7.org/linux/man-pages/man3/sched_getcpu.3.html
*/

#include <sched.h>


int main(){
    int cpu = sched_getcpu(); 
    

}