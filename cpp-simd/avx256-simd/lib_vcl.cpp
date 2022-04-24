#include "vcl/vectorclass.h"
#include <iostream>

using namespace std; 


int main(){
    Vec8d A = {1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0}; 
    Vec8d B = {1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0}; 

    Vec8d C = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0};

    C = A + B; 

    std::cout << "["; 
    for (int i = 0; i < 8; i++){
        std::cout << C[i] << ", "; 
    }
    std::cout << "]\n"; 

    return 0; 
}