# 2731. Movement of Robots

## 暴力法

可以观察到**机器人就是穿过去了**。

```python
import itertools

class Solution:
    # Operation on every pair of element in a list [duplicate]
    #   https://stackoverflow.com/questions/942543/operation-on-every-pair-of-element-in-a-list
    def sumDistance(self, nums: List[int], s: str, d: int) -> int:
        MOD = 10**9 + 7
        for i in range(len(nums)):
            nums[i] += d * (-1 if s[i] == 'L' else 1)
        ans = 0 
        for a, b in permutations(nums, 2): 
            ans = (ans + abs(a - b))
        return ans // 2 % MOD
```

到后面超时了。

## 官解

```python
import itertools

class Solution:
    def sumDistance(self, nums: List[int], s: str, d: int) -> int:
        MOD = 10**9 + 7
        for i in range(len(nums)):
            nums[i] += d * (-1 if s[i] == 'L' else 1)
        nums.sort() 
        ans = 0 
        n = len(nums)
        for i in range(1, n):
            ans += i * (n - i) * (nums[i] - nums[i-1])
        return ans % MOD
```