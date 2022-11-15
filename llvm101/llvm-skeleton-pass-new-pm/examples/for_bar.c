//=============================================================================
// FILE:
//      input_for_cc.c
// DESCRIPTION:
//      Sample input file for CallCounter analysis .
//      (the 'opcodeCounter', 'staticCallCounter', 'dynamicCallCounter')
//
// License: MIT
//=============================================================================
#include <stdio.h>

void foo() {
  printf("((foo))\n");
}

void bar() {
  printf("((bar))\n");
  foo(); 
}

void fez() {
  printf("((fez))\n");
  bar(); 
}

int main() {
  printf("((main))\n");

  foo();
  bar();
  fez();

  int ii = 0;
  for (ii = 0; ii < 10; ii++)
    foo();
  
  return 0;
}