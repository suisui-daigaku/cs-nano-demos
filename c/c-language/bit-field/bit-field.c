#include <stdint.h>
#include <stdio.h>



typedef struct _exit_info_t
{
    uint32_t    vector:8;                /* Exception number of exceptions reported inside enclave */
    uint32_t    exit_type:3;             /* 3: Hardware exceptions, 6: Software exceptions */
    uint32_t    reserved:20;
    uint32_t    valid:1;                 /* 0: unsupported exceptions, 1: Supported exceptions */
} exit_info_t;


unsigned get_unsigned_from_exitinfo(exit_info_t *exinfo){
    return *((unsigned*)(exinfo)); 
}


int main(){

    exit_info_t exinfo = {0}; 
    printf("`exit_info_t size` %lu\n", sizeof(exit_info_t));
    printf("Intial: 0x%x\n", get_unsigned_from_exitinfo(&exinfo)); 

    exinfo.valid = 1; 
    printf("Set Valid Bit:  0x%x\n", get_unsigned_from_exitinfo(&exinfo)); 
    printf("%d\n", (get_unsigned_from_exitinfo(&exinfo) >> 31) & 1); 

}



