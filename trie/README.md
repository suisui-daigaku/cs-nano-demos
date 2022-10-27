# Trie 

A small toy. 

Please point out the mistakes. 

```
==3201== All heap blocks were freed -- no leaks are possible
```

### LeetCode 208. Implement Trie (Prefix Tree)

https://leetcode.com/problems/implement-trie-prefix-tree/

```cpp
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
}; 

```


### LeetCode 2185. Counting Words With a Given Prefix

https://leetcode.com/problems/counting-words-with-a-given-prefix/


```cpp
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

    bool hasPrefix(const std::string &Word){
        TrieNode *Node = Root; 
        for (char Ch : Word){
            if (!Node->Children.count(Ch)){
                break;
            }
            Node = Node->Children[Ch]; 
        }
        return Node->IsEnd; 
    }
}; 


class Solution {
public:
    int prefixCount(vector<string>& words, string pref) {
        int ans = 0; 
        Trie trie; 
        trie.insert(pref); 
        for (auto word : words){
            if (trie.hasPrefix(word)){
                ans++; 
            }
        }
        return ans; 
    }
};

```