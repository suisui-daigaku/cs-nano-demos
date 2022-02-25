# SIMD Unrolling Loop

## 参考资料 

[Studying Agner Fog 2: Unrolling Loops and Dependency Chains - YouTube](https://www.youtube.com/watch?v=6TRt6_RHhjs)

[PKUFlyingPig/CS61C-labs: my implementation for the CS61C labs in 2020 summer version (github.com)](https://github.com/PKUFlyingPig/CS61C-labs)

[CS 61C (berkeley.edu)](https://inst.eecs.berkeley.edu/~cs61c/su20/#by-week)

[Lab 8: SIMD Intrinsics and Unrolling (berkeley.edu)](https://inst.eecs.berkeley.edu/~cs61c/sp12/labs/08/)

---

The `main.cpp`

```
Naive Sum dt: 8.058000 ms
Unrolled Sum dt: 3.451000 ms
SSE Sum dt: 2.073000 ms
Unrolled SSE Sum dt: 2.088000 ms
```

```cpp
#include <cstdlib>
#include <ctime>
#include <cstdio>
#include <chrono>
#include <iostream>

#ifdef __SSE__
    #include <immintrin.h>
#else
    #error "SSE is not available... "
#endif

using namespace std; 

static const size_t N = 2e6; 

void print(int arr[], size_t n){
    for (size_t i = 0; i < n; i++){
        printf("%d ", arr[i]);
    }
    printf("\n");
}

// we assume the arrary size is equal. 
int sum_naive(int arr[], size_t n){
    clock_t start = clock();

    int ans = 0; 
    for (size_t i = 0; i < n; i++) 
        ans += arr[i]; 

    clock_t end = clock();
    printf("Naive Sum dt: %Lf ms\n", (long double)(end - start)*1000 / CLOCKS_PER_SEC);
    return ans; 
}

int sum_unrolled(int arr[], size_t n){
    clock_t start = clock();
    int ans = 0;  
    for (size_t i = 0; i < n/4*4; i += 4){
        ans += arr[i]; 
        ans += arr[i+1]; 
        ans += arr[i+2];
        ans += arr[i+3];
    }
    // handling the tail case 
    for (size_t i = n/4*4; i < n; i++){
        ans += arr[i]; 
    }
    clock_t end = clock();
    printf("Unrolled Sum dt: %Lf ms\n", (long double)(end - start)*1000 / CLOCKS_PER_SEC);
    return ans; 
}

// https://inst.eecs.berkeley.edu/~cs61c/sp12/labs/08/
int sum_naive_sse(int arr[], size_t n){
    clock_t start = clock();

    __m128i ans_vec = _mm_setzero_si128(); 
    for (size_t i = 0; i < n/4*4; i += 4){
        __m128i b = _mm_loadu_si128((__m128i*)(arr+i)); 
        ans_vec = _mm_add_epi32(ans_vec, b);
    }
    /* You'll need a tail case. */
    int ans_arr[4] = {0, 0, 0, 0}; 
    _mm_storeu_si128((__m128i*)ans_arr, ans_vec); 
    int ans = 0; 
    ans += ans_arr[0] + ans_arr[1] + ans_arr[2] + ans_arr[3]; 
    for (int i = n/4*4; i < n; i++){ ans += arr[i]; }
    clock_t end = clock();
    printf("SSE Sum dt: %Lf ms\n", (long double)(end - start)*1000 / CLOCKS_PER_SEC);
    return ans; 
}

int sum_unrolled_sse(int arr[], size_t n){
    clock_t start = clock();
    __m128i ans_vec = _mm_setzero_si128(); 

    for (size_t i = 0; i < n/16*16; i += 16){
        __m128i b = _mm_loadu_si128((__m128i*)(arr+i)); 
        ans_vec = _mm_add_epi32(ans_vec, b);

        b = _mm_loadu_si128((__m128i*)(arr+i+4)); 
        ans_vec = _mm_add_epi32(ans_vec, b);

        b = _mm_loadu_si128((__m128i*)(arr+i+8)); 
        ans_vec = _mm_add_epi32(ans_vec, b);

        b = _mm_loadu_si128((__m128i*)(arr+i+12)); 
        ans_vec = _mm_add_epi32(ans_vec, b);
    }

    int ans_arr[4] = {0, 0, 0, 0}; 
    _mm_storeu_si128((__m128i*)ans_arr, ans_vec); 
    int ans = 0; 
    ans += ans_arr[0] + ans_arr[1] + ans_arr[2] + ans_arr[3]; 
    for (int i = n/16*16; i < n; i++){ ans += arr[i]; }
    clock_t end = clock();
    printf("Unrolled SSE Sum dt: %Lf ms\n", (long double)(end - start)*1000 / CLOCKS_PER_SEC);
    return ans; 
}



int main(){
    int v1[N]; 

    /* initialize random seed: */
    // srand(time(NULL));

    /* sequential filling */ 
    sum_naive(v1, N); 
    // print(v1, N);  
    sum_unrolled(v1, N);
    // print(v1, N); 

    sum_naive_sse(v1, N); 

    sum_unrolled_sse(v1, N); 

}

```

