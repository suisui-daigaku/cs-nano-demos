INC_DIR = include/
CXX = clang++
CC = clang
FLAGS = -g -std=c++17 -Wall
ASM = as

LDFLAGS = 

all: intrinSIMD.bin vclSIMD.bin asmSIMD.bin
	

intrinSIMD.bin: intrinsic_function.cpp
	$(CXX) $(FLAGS) -mavx intrinsic_function.cpp -o intrinSIMD.bin 

vclSIMD.bin: lib_vcl.cpp
	$(CXX) $(FLAGS) lib_vcl.cpp -I$(INC_DIR) -o vclSIMD.bin

asmSIMD.bin: asm_vector_addition.s asm_simd.cpp
	$(ASM) asm_vector_addition.s -o asm_func.o
	$(CXX) $(FLAGS) -mavx -o asmSIMD.bin asm_simd.cpp asm_func.o

clean:
	rm *.bin
	rm *.o