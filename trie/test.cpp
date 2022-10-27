#include "Trie.h"
#include <fstream>
#include <iostream>

int main(){
    Trie trie;
    std::ifstream infile("test/words.txt"); 
    if (infile.is_open()) {
        std::string funcName;
        while (std::getline(infile, funcName)){
            trie.insert(funcName); 
        }
        infile.close(); 
    }
    std::cout << trie.search("something") << "\n"; 
}