#include "Trie.h"
#include <algorithm>
#include <string>

Trie::TrieNode::~TrieNode(){
    for (auto Itr = Children.begin(); Itr != Children.end(); Itr++){
        delete Itr->second; 
    }
}

Trie::TrieNode::TrieNode() : IsEnd(false) {

}

Trie::Trie() : Root(new TrieNode()){

}

Trie::~Trie(){
    delete Root; 
}

void Trie::insert(const std::string &Prefix){
    TrieNode *Node = Root; 
    for (char Ch : Prefix){
        if (!Node->Children.count(Ch)){
            Node->Children[Ch] = new TrieNode(); 
        }
        Node = Node->Children[Ch]; 
    }
    Node->IsEnd = true; 
}

bool Trie::search(const std::string &Prefix){
    TrieNode *Node = Root; 
    for (char Ch : Prefix){
        if (!Node->Children.count(Ch)){
            return false;
        }
        Node = Node->Children[Ch]; 
    }
    return Node->IsEnd;
}

bool Trie::startsWith(const std::string &Prefix){
    TrieNode *Node = Root; 
    for (char Ch : Prefix){
        if (!Node->Children.count(Ch)){
            return false;
        }
        Node = Node->Children[Ch]; 
    }
    return true; 
}


bool Trie::hasPrefix(const std::string &Word){
    TrieNode *Node = Root; 
    for (char Ch : Word){
        if (!Node->Children.count(Ch)){
            break;
        }
        Node = Node->Children[Ch]; 
    }
    return Node->IsEnd; 
}

// abcdefg
// abc 