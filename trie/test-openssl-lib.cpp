#include "Trie.h"
#include <fstream>
#include <iostream>
#include <system_error>

int main(){
    std::cout << ">>=========== Trie Test ===========<<\n"; 

    Trie trie;
    trie.insert("crypto/"); 
   

    std::ifstream infileWords("inputs/openssl_filename.txt"); 
    if (infileWords.is_open()) {
        std::string word;
        while (std::getline(infileWords, word)){
            if (trie.hasPrefix(word)){
                std::cout << word << "\n"; 
            }
        }
        infileWords.close(); 
    }else{
        std::cerr << "ERROR\n"; 
        return 1; 
    }

    std::cout << ">>=================================<<\n"; 
}