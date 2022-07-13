#include <stdio.h>

void bar(); 


void foo(){
    bar(); 
    printf("foo\n");
}

int main(){
    foo(); 
}

