#include <cstdio>
#include "vcl/vectorclass.h"


using namespace std; 


int main(){
    Vec4d A = {1.0, 2.0, 3.0, 4.0}; 
    Vec4d B = {1.0, 2.0, 3.0, 4.0}; 

    Vec4d C = {0.0, 0.0, 0.0, 0.0};

    C = A + B; 

    printf("[%lf, %lf, %lf, %lf]\n", C[0], C[1], C[2], C[3]); 

    return 0;
}