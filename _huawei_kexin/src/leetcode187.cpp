#include <string>
#include <vector>
#include <unordered_map>
#include <iostream>

using namespace std;


class Solution {
public:
    vector<string> findRepeatedDnaSequences(string s) {
        unordered_map<string, int> cnt; 
        int n = s.size(); 
        int i = 0; 
        while (i < (n - 9)){
            string pat = s.substr(i, 10);
            cnt[pat] += 1; 
            i++;
        } 

        vector<string> ans; 
        for (auto kv : cnt){
            if (kv.second > 1){
                ans.push_back(kv.first); 
            }
        }

        return ans; 
    }
};


