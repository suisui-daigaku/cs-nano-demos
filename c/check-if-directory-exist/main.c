#include <sys/stat.h>
#include <stdio.h>


int init_pstate_dir_status(){
    const char path[] = "/sys/devices/system/cpu/intel_pstate"; 
    printf("[ sgx-step ] opening path at %s ...\n", path); 
    struct stat sb;
    int err = stat(path, &sb);
    if (err == 0 && S_ISDIR(sb.st_mode)) {
        printf("[ sgx-step ] intel_pstate is available \n"); 
        return 1; 
    } else {
        printf("[ sgx-step ] intel_pstate is not available \n"); 
        return 0; 
    }
}

int has_pstate(void){
    static int initilized = 0;
    static int pstate_status = -1; 
    return initilized ? pstate_status : (initilized = 1, pstate_status = init_pstate_dir_status()); 
}

int main(){
    printf("has_pstate: %d\n", has_pstate()); 
    printf("has_pstate: %d\n", has_pstate()); 
}

