//
// Created by haohua on 4/2/2022.
//

#include "stdio.h"

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
    printf("%d\n", f1(1));
    printf("%d\n", f2(1, 100));

    return 0;
}
