#include <cstdio>

using namespace std; 

int foo(int a){
    return a + 1; 
}

int bar(int a, int b){
    return a + b + 1; 
}

int main(){ 
    foo(1); 
    bar(1, 11); 
    return 0; 
}

