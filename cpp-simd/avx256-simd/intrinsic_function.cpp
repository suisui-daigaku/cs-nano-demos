#include <immintrin.h>

using namespace std; 

int main(){
    __m256d A = {1.0, 2.0, 3.0, 4.0}; 
    __m256d B = {8.0, 7.0, 6.0, 5.0}; 
    __m256d C = {0.0, 0.0, 0.0, 0.0}; 

    C = _mm256_add_pd(A, B); 

    

    return 0; 
}