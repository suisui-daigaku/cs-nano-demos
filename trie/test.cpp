#include "Trie.h"
#include <fstream>
#include <iostream>
#include <system_error>

int main(){
    std::cout << ">>=========== Trie Test ===========<<\n"; 

    Trie trie;
    std::ifstream infilePrefix("inputs/en_prefix.txt"); 
    if (infilePrefix.is_open()) {
        std::string prefix;
        while (std::getline(infilePrefix, prefix)){
            trie.insert(prefix); 
        }
        infilePrefix.close(); 
    }else{
        std::cerr << "ERROR\n"; 
        return 1; 
    }

    std::ifstream infileWords("inputs/en_words.txt"); 
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