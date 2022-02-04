//
// Created by haohua on 4/2/2022.
//

#include <iostream>

int f1(int a){
    return a;
}

int f2(int a, int b){
    return a + b;
}

int f3(int a, int b, int c){
    return a + b + c;
}

int main(){
    std::cout << f1(1) << "\n";
    std::cout << f2(100, 1) << "\n";
    // and remove f3 since f3 is not called.

    return 0;
}
