/****************************************************************
 * What is mangling? 
 *  https://cnlelema.github.io/memo/en/compilers/basics/mangling/
 * 思考问题:
 *  为什么 C 语言不支持 Overloading 和 静态多态?
 * 
 * What is calling convention? 
 *  https://bygeek.cn/2018/09/05/what-is-calling-convention/
 * 
 * How use add calling convention to function in Windows or MacOS?
 *  https://www.intel.com/content/www/us/en/develop/documentation/cpp-compiler-developer-guide-and-reference/top/compiler-reference/c-c-calling-conventions.html
 *  
 * Detect Operating System in C 
 * https://iq.opengenus.org/detect-operating-system-in-c/
 * 
 * 《程序员的自我修养–链接，装载与库》
 ****************************************************************/ 

#include <stdio.h>


#ifdef __WIN32__
    // for all Windows OS 
    int _cdecl foo (int i) {return 1;}
    int _stdcall bar (int i) {return 2;}
#else
    // for all MacOS and Linux 
    __attribute__((cdecl)) int foo (int i) {return 3;}
    __attribute__((regcall)) int bar (int i) {return 4;}
#endif

int main(){
    return 0; 
}

/****************************************************************
 * 要调用这个程序(clang driver)
 * https://stackoverflow.com/questions/10990018/how-to-generate-assembly-code-with-clang-in-intel-syntax
 * ```
 *  clang -S -mllvm --x86-asm-syntax=intel mangling.c 
 * ``
 *  可以看到 分别是 `@foo` 和 `@__regcall3__bar` 
 *  我的 macbook 好像不支持 stdcall , 不知道为什么...
****************************************************************/ 
