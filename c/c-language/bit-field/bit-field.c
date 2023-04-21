#include <stdint.h>
#include <stdio.h>

void printBits(size_t const size, void const * const ptr)
{
    unsigned char *b = (unsigned char*) ptr;
    unsigned char byte;
    int i, j;
    
    for (i = size-1; i >= 0; i--) {
        for (j = 7; j >= 0; j--) {
            byte = (b[i] >> j) & 1;
            printf("%u", byte);
        }
    }
    puts("");
}

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
    printf("Set Valid Bit:  0x%x\n", get_unsigned_from_exitinfo(&exinfo) >> 31); 
    exinfo.valid = 0; 

    exinfo.exit_type = 0b110; 
    printf("Set EXIT_TYPE: 0x%x\n", (get_unsigned_from_exitinfo(&exinfo) >> 8) & (0x7));
    exinfo.exit_type = 0; 

    exinfo.vector = 0xff; 
    printf("Set Vector: 0x%x\n", (get_unsigned_from_exitinfo(&exinfo) & (0xff))); 
    exinfo.vector = 0; 

    printf("\n=========================================================\n");

    uint32_t exinfo_u = 0x306; // 001100000110

}



