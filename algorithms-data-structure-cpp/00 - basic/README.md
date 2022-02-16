# 基础

## C++ 基础

- 使用 `explicit` 修饰函数/方法避免 隐形类型转换 to avoid implicit type conversion. 
- C++ Class 
  - Member: **Data** and **Method** 
    - Encapsulation: `private` and `public` 
    - Accessor & Mutator : whether change the **state** of its object 
      - Accessor: 如 `Type1 method(Type2 ) const {}` , 表示不会对 object 的进行浅层修改
        -  [C++ Const 关键字 (haohua-li.github.io)](https://haohua-li.github.io/2021/08/15/cpp-const.html)
        - 非对象本身的内容 (只保证 bitwise constness)。如指针的外部地址内容、Static，还有 Mutable data member。
        - 还可以看看使用 `mutable` 的情况 [C++ Mutable 关键字 (haohua-li.github.io)](https://haohua-li.github.io/2021/08/15/cpp-mutable.html)
      - Mutator:  就是 setter 
  - Interface & Implementation 
    - ***Interface***: 即 header files 里面的 function prototype declaration , 需要用到 include guard , [Header File Include Guard (haohua-li.github.io)](https://haohua-li.github.io/2022/01/26/header-file-guard.html)
      - ***Note that default parameters are specified in the interface only.***
      - 注意 default parameter 必须在 header file 里面设置，这是因为 IDE 只提示 header file 的注释。
    - ***implementation***: 即 cpp 文件通过 *Scope Resolution Operator* 写具体的 definition 
  - Constructors: 
    - Rule of Three & Rule of Five [9.6. Constructors And Initializer Lists (weber.edu)](https://icarus.cs.weber.edu/~dab/cs1410/textbook/9.Classes_And_Objects/constructors.html)
    - *Initialization List*: 
      - 只有 constructor 有 *Initialization List* , 且 initialization list 早于 contrunctor 运行. [9.6. Constructors And Initializer Lists (weber.edu)](https://icarus.cs.weber.edu/~dab/cs1410/textbook/9.Classes_And_Objects/constructors.html)
      - 注意 *Initialization List* 里的变量是无序的，所以不能有依赖关系。具体参考 [Compiler Warning C5038 | Microsoft Docs](https://docs.microsoft.com/en-us/cpp/error-messages/compiler-warnings/c5038?view=msvc-170)
      - 使用新标准 `: storedValue{ initialValue }  { }`  。
        - 因为普通 list initialization 也是 braces 。比如 `int a{10}` , 但 `int a(10)` 实际上也支持。
      - 必须使用 initialization list 的情况 [When do we use Initializer List in C++? - GeeksforGeeks](https://www.geeksforgeeks.org/when-do-we-use-initializer-list-in-c/)
        - 初始化 non-static const data members : 由于 symbol table 的问题? 
        - 初始化 reference data member, 比如 `int &t`
        - 初始化 没有 default constructor 的 data member , 如下面 例1.1  
        - Child Class 的 Base Class 没有 default constructor, 这在 LLVM 经常见到 , 如下面 例子 1.2 
      - 一般来说使用 initialization list 更快，如下面例子 1.3 
    - **必须使用 `explicit` 修饰所有 one-parameter constructors**, 如下面例子 1.4. 
  - 隐式赋值操作符会进行**浅层复制** (implicit assignment operator will conduct shallow copy), 见例子 1.5 
  - Object : an instance of a class  
  - `static` data in class : must be a global variable 
  - ***Uniform initialization syntax*** using braces `{}` , 见例子 1.6 
    - 但是因为 `vector` 可以用 ***Uniform initialization syntax*** , 容易造成混乱。实际上不推荐。
  - 了解 指针的基本用法 和 dynamic memory allocation 
  - ***Lvalues, Rvalues, and References***
    - An **lvalue** is an expression that identifies a non-temporary object
    - An **rvalue** is an expression that identifies a temporary object or is a value (such as a literal constant) not associated with any object. 
    - 是否在 compiler time 就确定，就是 rvalue 和 lvalue 的区别
    - ***lvalue reference*** & ***rvalue reference*** , 参考 例子 1.7 
      - lvalue reference: *aliasing*, *avoiding a copy* in for loop or function 
  - Parameter Passing
    - call-by-value
    - call-by-reference
      - call-by-lvalue-reference. 如果不改变就用 `const`, 如果改变用 pointer 
      - call-by-rvalue-reference
    - call by pointer 
  - Return Passing idioms
    - ***return-by-value***, 见 例子 1.9  
    - ***return-by-constant-reference*** 可以避免复制 (用了 `const` 其实跟 return-by-value 差不多)
    - return-by-reference (允许对数据内部进行修改)
- `std::swap` & `std::move` ， 看 例子 1.8 
  - **其中 `std::swap` 利用了 `std::move` 的特性 **。
  - 其中 `std::move` 实际上仅仅进行了**指针转换** (即从 lvalue-reference 到 rvalue-reference)
- The Rule of Five / Big - Five 
  - Rule of Three & Rule of Five [9.6. Constructors And Initializer Lists (weber.edu)](https://icarus.cs.weber.edu/~dab/cs1410/textbook/9.Classes_And_Objects/constructors.html)
  - **Constructor, Desctructor**: 需要满足 RAII
    - Destructor 必须为 virtual function   
    - Copy Constructor, Move Constructor.  例如 `A a2 = a1; ` 或者 `A a2(a1);` 或者 `A a2{a1};`
    - Copy Assignment `operator=`, Move Assignment `operator=` 
  - ***了解 Deep Copy 和 Shallow Copy*** ， 为什么需要 Big-five 原则 (rvalue 不需要 `const`)， 参考 例子 1.10 
  - 通常 Copy Assignment `operator=` 会使用  **copy-and-swap idiom** , 能够重复使用 copy constructor
    - 在实现 Copy assignment 的同时必须同时实现 Move assignemnt 
    - 参考 例子 1.11
- C-style Arrays and Strings
  - array 的指针性质。array 大小必须在 compiler time 确定。使用 `delete[]` 删除数组
  - string 需要注意实际大小是 `n+1` , 因为以 null-terminator  `\0` 结尾。
- Templates 
  - 了解什么是 function templates 以及 code bloat ，见 例 1.12 
    - 在实现的时候要记住 Template 不是 primitive types，有可能非常大，所以更加倾向于用 constant reference 。
    - 普通函数 比 function templates 有更高优先级
  - 了解 Class Templates 和 Class Method Templates 
    - ***一般 interface 和 implemenataion 都全部在 `.h` 实现***，比如 STL 就是纯 `.h` 库
  - 

#### 例 1. 1 

把 `a` 的初始化放到 Initialization list 时，早于 B 的 constructor 运行。

可以避免 `A ` has no default constructor 

```cpp
class A {
    int i; 
public:
    A (int arg){
        i = arg; 
        std::cout << "A's constructor called: Value of i = " << i << std::endl;
    }
}; 

class B{
    A a; 
public:
    B (int x) : a{x} {
        std::cout << "B's constructor called" << std::endl;
    }
}; 

int main(){
    B(10); 
}
```

#### 例 1.2 

其中 `FunctionPass` 没有 default constructor ，因为必须接受内存地址来区分 passes 。

```cpp
struct HelloWorld : public FunctionPass{
    static char ID; 
    HelloWorld() : FunctionPass(ID) {} 
  
    bool runOnFunction(Function &F) override{
        errs() << "Hello World from Legacy PM.\n"; 
        return false; 
    }
}; 
```

#### 例 1.3 

```cpp
class T {
public:
    string msg = "T's constructor called"; 
    T () { std::cout << msg << std::endl; }
}; 

class MyClass{
public:
    T data; 
    MyClass (T data) { this->data = data; }
}; 

int main(){
    std::cout << MyClass(T()).data.msg << std::endl; 
    return 0; 
}
```

运行

```bash
clang++ -std=c++11 -O0 test.cpp 
>>> T's constructor called
>>> T's constructor called
>>> T's constructor called
```

- 第一个是 `T()`
- 第二个是 `MyClass::data` 的 data member 初始化
- 第三个是 `MyClass (T data)` 的 parameter 初始化

如果使用 initialization list 之后 

```cpp
class T {
public:
    string msg = "T's constructor called"; 
    T () { std::cout << msg << std::endl; }
}; 

class MyClass{
public:
    T data; 
    MyClass (T data) : data(data) {}
}; 

int main(){
    std::cout << MyClass(T()).data.msg << std::endl; 
    return 0; 
}
```

```
T's constructor called
T's constructor called
```

- 第一个是 `T()`
- 第二个是  `MyClass (T data)`  。因为 `MyClass::data` 没有运行默认构造器。

#### 例 1.4 

**a one-parameter constructor defines an implicit type conversion.** (a temporary object is created for assignment)

```cpp
class A{
    int value; 
public:
    explicit A (int initialValue = 0) : value(initialValue) {}
}; 
```

For example, the compiler would attempt to convert 

```
A obj;     
obj = 37;       
```

into 

```
A obj; 
obj = A(37); 
```

但是如果 `explicit` 编译器就不会自动进行类型转换 (即将 `int` 转换为 `A`) 。

#### 例 1.5

[Delete Node in a Linked List - LeetCode](https://leetcode.com/problems/delete-node-in-a-linked-list/)

看到 [梦璃夜天星](https://thwiki.cc/梦璃夜天星) 写的, 隐式的赋值操作符进行的**对象浅复制**。(缺点是会缺漏内存)

```cpp
/* 
struct ListNode {
    int val;
    ListNode *next;
    ListNode(int x) : val(x), next(nullptr) {}
};
*/ 

class Solution {
public:
    void deleteNode(ListNode* node) {
        *node = *node->next; 
    }
};
```

#### 例 1.6 

```cpp
IntCell obj1;        // Zero parameter constructor
IntCell obj2( 12 );  // One parameter constructor
IntCell obj4( );     // Function declaration

// Uniform initialization syntax
IntCell obj1;        // Zero parameter constructor, same as before
IntCell obj2{ 12 };  // One parameter constructor, same as before
IntCell obj4{ };     // Zero parameter constructor
```

#### 例 1.7 

```cpp
int main(){
    string& str = "hello"; // illegal
    string&& bad = "hello"; 

    return 0; 
}
```

#### 例 1.8

```cpp
class A{
    int data; 

public:
    explicit A(int x) : data(x) { }

    A(const A& a) {
        // 模拟需要复制的过程... 
        std::cout << "copying..." << std::endl;
        std::this_thread::sleep_for(std::chrono::seconds(2));
        this->data = a.data;
    }; 
    
    A(const A&& a){
        this->data = a.data;
    }
  
    A& operator= (const A& rhs) {
        this->data = rhs.data;
        return *this; 
    }

    int get() { return data; }
}; 


void swap(A &x, A &y){
    A tmp = x; // 注意: 等效于 `A tmp(x)` ，所以需要修改 copy constructor 
    x = y; 
    y = tmp;
}

int main(){
    A a1(1); 
    A a2(2); 
    std::cout << "a1 = " << a1.get() << ", a2 = " << a2.get() << std::endl;
    std::cout << "swapping..." << std::endl;
    swap(a1, a2);
    std::cout << "a1 = " << a1.get() << ", a2 = " << a2.get() << std::endl;
}
```

实际上可以进行的 **`swap` 直接调用 move constructor / move assignment operator**  (上面的例子没有写 move assignment operator, 但是由于写了 assignment operator, 会直接调用)。

```cpp
// STL 中的 swap 实现。
swap(_Tp& __x, _Tp& __y) _NOEXCEPT_(is_nothrow_move_constructible<_Tp>::value &&
                                    is_nothrow_move_assignable<_Tp>::value)
{
    _Tp __t(_VSTD::move(__x));
    __x = _VSTD::move(__y);
    __y = _VSTD::move(__t);
}

// swap的实现简化版。
inline void swap(A &x, A &y){
    A tmp = std::move(x); // 等价于 `A tmp(std::move(x))` 
    x = std::move(y); 
    y = std::move(tmp); 
}
```

实际上 `std::move` 仅仅只是将 Object 标记为 rvalue-reference 

```cpp
// STL 中 move 的实现
move(_Tp&& __t) _NOEXCEPT
{
    typedef _LIBCPP_NODEBUG_TYPE typename remove_reference<_Tp>::type _Up;
    return static_cast<_Up&&>(__t);
}
```

所以事实上，`swap` 的实现为

```cpp
void swap(A &x, A &y){
    A tmp = static_cast<A&&>(x); // 调用 move copy constructor
    x = static_cast<A&&>(y); // 调用 move assignment operator 
    y = static_cast<A&&>(x); // 
}
```

#### 例 1.9 

关于 Return by Value 几种特殊情况

- **local stack variable 编译器会调用 constructor 并直接返回 (不会重复构建)**
- 如果返回对象是 lvalue 调用 copy constructor 
- 如果返回对象是 rvalue 调用 move constructor 

```cpp
class A{
public:
    A() { }

    A(const A& a) {
        std::cout << "copying...(3seconds)" << std::endl;
        std::this_thread::sleep_for(std::chrono::seconds(3));
    }; 
    
    A(const A&& a){
        std::cout << "Transferring ownership..." << std::endl;
    }
}; 

A createA(){
    A tmp; 
    return tmp; 
}

A copyA(const A& x){
    return x; 
}

A moveA(const A&& x){
    return x; 
}

int main(){
    A a1 = createA();
    A a2 = copyA(a1);
    A a3 = moveA(A()); 
}
```

#### 例 1.10 

```cpp
~IntCell( );																			// Destructor
IntCell( const IntCell & rhs );									  // Copy constructor
IntCell( IntCell && rhs );												// Move constructor
IntCell & operator= ( const IntCell & rhs );			// Copy assignment
IntCell & operator= ( IntCell && rhs );						// Move assignment
```

或者可以禁用 `std::move`

```cpp
IntCell( IntCell && rhs ) = delete;									// Move constructor
IntCell & operator= ( IntCell && rhs );	= delete	  // Move assignment
```

#### 例 1.11 

注意 **copy-and-swap idiom** 有可能会进入死循环。

- 因为 `std::swap()` 的内部使用了 move assignemnt ，
- 如果没有实现 move assignment，会自动调用 copy assignemnt,  这样又会继续调用 `std::swap`
- 进入死循环。因此在实现 Copy assignment 的同时必须同时实现 Move assignemnt 

**注意在 move assignment 用了 `std::swap()`** 

- ***`std::swap()` 依旧会用到 move assignment operator ，如果处理不小心也会死循环。***

```cpp
class A{
public:
    int *data; 

    explicit A(int x) { 
        data = new int{x}; 
    }

    virtual ~A(){ delete data; }

    A(const A& rhs) {
        std::cout << "copying...(2 seconds)" << std::endl;
        std::this_thread::sleep_for(std::chrono::seconds(2));
        data = new int{*rhs.data}; 
    }; 

    A(A && rhs) : data(rhs.data) {
        rhs.data = nullptr; 
    }
 
    A &operator=(const A& rhs) {
        // 防止自赋值 (因为没有必要，仅仅为了效率问题)
        if (this == &rhs) return *this;
        // 复制
        A copy = rhs; 
        std::swap(*this, copy); 
        return *this; 
    }

    A & operator=(A&& rhs) {
        // member-by-member 交换。
        std::swap(data, rhs.data); 
        return *this; 
    }
}; 

int main(){
    A a1(1); 
    A a2(2); 
    std::cout << "a1 = " << *a1.data << ", a2 = " << *a2.data << std::endl;
    a1 = a1; 
    a1 = a2; 
    std::cout << "a1 = " << *a1.data << ", a2 = " << *a2.data << std::endl;
}
```

####  例 1.12 

***Function templates*** 本质并不是 function ，只是一个 pattern 。

编译器会自动为你写相关的代码，所以可能会带来 code bloat 。



## Analysis of Algorithms 

主要参考 *Data Structures and Algorithm Analysis in C++* by Mark Allen Weiss

- 了解 Exponents 公式
- 了解 Logarithms 公式 (以及如何通过 logarithms 的定义去证明这些公式)
- 了解 series 的求和
  - geometric series 等比数列
  - arithmetic series 等差数列
  - 还有一种 等比和等差数列的结合体 $i/ 2^i$ 
  - **Faulhaber's formula** 
    - [Sum of n, n², or n³ | Brilliant Math & Science Wiki](https://brilliant.org/wiki/sum-of-n-n2-or-n3/)
    - [Faulhaber's Formula -- from Wolfram MathWorld](https://mathworld.wolfram.com/FaulhabersFormula.html)
    - $k = -1$ & harmonic sum & **Euler’s constant**
  - 容斥原理在 series 上的应用
  - $\sum f(N)$ 自变量无关的求和
- 了解 模的算术 Modular Arithmetic
  - $A \equiv B  \pmod N$
    -  A is congruent to B modulo 
    - `\pmod` means parentheses with mod operator  
  - $A + C \equiv B + C \pmod N$
  - $AD \equiv BD \pmod N$
  - 除以 `N` 后 , `A` 和 `B` ‘看起来相等 (remainder 相等)
  - 设 $N$ 为 prime number, 然后有 three theorems 
    - $ab \equiv 0 \pmod N$ if and only if $a \equiv 0 \pmod N$ or $b \equiv 0 \pmod N$  
      - 很容易证明 (除以 N 以后会展现相等的特性)
    - $ax \equiv 1 \pmod N$ has a unique solution $x$ for all $0 < a < N$ 
      - 其中 $0 < x < N$ 叫  *multiplicative inverse*
    - $x^2 \equiv a \pmod N$ has either two solutions $\pmod N$ for all $0 < a < N$, or it has no solutions. 
- 了解如何证明 statements 
  - to prove true 
    - **proof by induction** : base case, inductive hypothesis, 
    - **proof by contradiction** : 
      - **assumption**: assume the theorem is false. 
      - show the assumption above implies some known property is false. 
      - the assumption is wrong 
  - to prove false 
    - proof by counterexample 
- 了解 Recursion : 
  - *Base Case* , 
  - *Making progress*
  - 记忆化







