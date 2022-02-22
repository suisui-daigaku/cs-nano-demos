

// clang -O0 -S hello-world-slow.c -o hello-world-slow.s

void increment(int arr[], unsigned n) {
    unsigned i = 0; 
    while (i < n){
        arr[i] += 1;
        i++;  
    }

}

int main(){
    int arr[4] = {-1, 2, 3, 4};
    increment(arr, 4);  
    return 0; 
}

