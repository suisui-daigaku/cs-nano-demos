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

void foo() { }
void bar() {foo(); }
void fez() {bar(); }

int main() {
  foo();
  bar();
  fez();

  // void (*p) () = &foo; 
  // p(); 

  int ii = 0;
  for (ii = 0; ii < 10; ii++)
    foo();

  return 0;
}