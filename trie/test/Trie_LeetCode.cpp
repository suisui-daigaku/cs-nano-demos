#include <map>
#include <string>


class Trie{
    struct TrieNode{
        std::map<char, TrieNode*> Children;
        bool IsEnd; 
        TrieNode() : IsEnd(false){}
        ~TrieNode(){
            for (auto Itr = Children.begin(); Itr != Children.end(); Itr++){
                delete Itr->second; 
            }
        }
    }; 
    TrieNode *Root; 

public:
    Trie() : Root(new TrieNode()){ }
    ~Trie() {
        delete Root; 
    }

    void insert(const std::string& Prefix){
        TrieNode *Node = Root; 
        for (char Ch : Prefix){
            if (!Node->Children.count(Ch)){
                Node->Children[Ch] = new TrieNode(); 
            }
            Node = Node->Children[Ch]; 
        }
        Node->IsEnd = true; 
    }

    void insert(const std::string &&Prefix){
        this->insert(std::move(Prefix)); 
    }

    bool search(const std::string& Prefix){
        TrieNode *Node = Root; 
        for (char Ch : Prefix){
            if (!Node->Children.count(Ch)){
                return false;
            }
            Node = Node->Children[Ch]; 
        }
        return Node->IsEnd;
    }

    bool search(const std::string &&Prefix){
        return this->search(std::move(Prefix)); 
    }

    bool startsWith(const std::string& Prefix){
        TrieNode *Node = Root; 
        for (char Ch : Prefix){
            if (!Node->Children.count(Ch)){
                return false;
            }
            Node = Node->Children[Ch]; 
        }
        return true; 
    }

    bool startsWith(const std::string &&Prefix){
        return this->startsWith(std::move(Prefix)); 
    }
}; 

