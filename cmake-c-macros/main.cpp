#include <iostream>

int main(int argc, char** argv){
	std::cout << "Hello World!" << std::endl;
#ifdef DEBUG
	std::cout << "[[ DEBUG ]]: hello from debug info..." << std::endl;  
#endif 
	return 0;
}
