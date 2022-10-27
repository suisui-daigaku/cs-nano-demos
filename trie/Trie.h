#include <map>
#include <string>


class Trie{
    
    struct TrieNode{
        std::map<char, TrieNode*> Children;
        bool IsEnd; 
        TrieNode(); 
        ~TrieNode(); 
    }; 
    TrieNode *Root; 

public:
    Trie(); 
    ~Trie(); 

    void insert(const std::string& Prefix); 
    bool search(const std::string& Prefix);
    bool startsWith(const std::string& Prefix); 
    bool hasPrefix(const std::string &Word); 
}; 
