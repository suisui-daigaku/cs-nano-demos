// pass the macros by -DPAGES_COUNT=4096

#ifndef PAGES_COUNT
#define PAGES_COUNT 8192
#endif

#include <errno.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdlib.h>

static const int MAX_PAGES_COUNT = 512000; // assume use up to 2GB
static const int PAGE_SIZE = 4096; 
// 1GB = 1048576 KB --> 1048576 / 4.096 = 256000
// 16MB = 16384 KB --> 16384 / 4.096 = 4000




int main(int argc, char** argv){   
    if (PAGES_COUNT > MAX_PAGES_COUNT){
        printf("PAGES_COUNT must be less than 512000....\n");
        return -1;
    }

    printf("\nusing local stack....\n");
    unsigned char* buff[MAX_PAGES_COUNT+1];

    printf("PAGES_COUNT: %d\n", PAGES_COUNT); 
    printf("allocating pages  ....\n");
    int allocated_pages = 0; 
    for (int i = 0; i < PAGES_COUNT; i++){
        void *ptr = calloc(1, PAGE_SIZE);
        if (ptr == NULL){
            break; 
        }
        buff[i] = ptr;
        allocated_pages++; 
    }
    
    printf("\n=========================================\n"); 
    printf("pages that allocated: %d\n", allocated_pages); 
    for (int i = 0; i < allocated_pages; i++){
        free(buff[i]); 
    }
    
    printf("\nfreed all allocated heap space....\n");
    return 0;
}
