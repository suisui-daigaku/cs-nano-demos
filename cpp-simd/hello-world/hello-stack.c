
// clang -O0 -S -target x86_64-apple-macosx12.0.0 hello-stack.c -o hello-stack.s
// clang -O0 -S -target x86_64 hello-stack.c -o hello-stack.s

int add2(int a, int b){
    return a + b; 
}

int add3(int a, int b, int c){
    return a + b + c;
}

int main(){
    return 0; 
}