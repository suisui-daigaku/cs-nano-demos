#include <iostream>

 
#define OE_PAGE_SIZE (uint64_t) 0x1000
#if defined(OE_HEAP_ALLOTTED_PAGE_COUNT)
#define OE_HEAP_ALLOTTED_SIZE (OE_HEAP_ALLOTTED_PAGE_COUNT * OE_PAGE_SIZE)
#else
#define OE_HEAP_ALLOTTED_SIZE (8192 * OE_PAGE_SIZE) // around 32 MB
#endif

int main(int argc, char** argv){
	std::cout << "Hello World!" << std::endl;
	std::cout << "OE_HEAP_ALLOTTED_SIZE = " << OE_HEAP_ALLOTTED_SIZE << " bytes. " << std::endl; 
	return 0;
}
