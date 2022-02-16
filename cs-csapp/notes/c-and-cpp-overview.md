# The Secret Life of C++: What Your Compiler Doesn't Want You To Know

这个角度挺好的。因为 C++ 的语法查 cppreference 就有，但是 VTable 是什么，Template 的本质，RTTI 的机制等等，一般 C++ 的书籍是根本不会涉及。这反而会更加让人云里雾里。

> C++ is filled with strange and wonderful features, with a few more added in C++11. We will explore in detail how these features are implemented under the covers, in terms of the assembly code generated. Features to be explored include construction and destruction, copying, references, virtual methods, method dispatch, object layout, exceptions, templates, anonymous functions, captures, and more. No one should claim to be a C++ expert (including the instructor) but this class should help you win a geek fight (or job interview) with anyone who does. 

## C 语言

由于 C 实际上是 Machine-dependent 的，有必要了解一下 X64 的大小 [The Not So Secret Life of C (mit.edu)](http://web.mit.edu/tibbetts/Public/inside-c/www/c-primer.html)

由于虚拟地址的技术，内存空间马上简化了很多。[The Not So Secret Life of C (mit.edu)](http://web.mit.edu/tibbetts/Public/inside-c/www/c-primer.html)

**只有 Text, Data, BSS, Heap, Stack 这几个 Segments** 

- Global Variable (在 Data 或者 BSS, 并没有实际的 operation code)
- Functions (`call` instruction)
  - Calling convention 函数的调用时的约定 (类似 Big-endian and Little-endian 之类的约定)
- Control Strutcure (conditional `jump` instrunction)
- Pointer (逻辑地址 -> 线性地址 -> 物理地址)
- Array (pointer, offset)
- Structures (类似允许不同类的 array, offset 显然和 type 有关) 
- Union (类似 structure/array，但是任何时候只有一个成员带有值，即 offset 是重叠的)

### Linker in C 

**由于 C Linker 通过 function name 链接**，所以不支持 overloading 。

C++ 在 Linking 的时候会保留  function name, parameter type, return type, calling convention 的信息，所以支持 static polymorphism. 

指针实际上只是偏移量，并不是完整的地址。

- [C/C++ Calling Conventions (intel.com)](https://www.intel.com/content/www/us/en/develop/documentation/cpp-compiler-developer-guide-and-reference/top/compiler-reference/c-c-calling-conventions.html)
- [什么是调用惯例 | bygeek's Playground](https://bygeek.cn/2018/09/05/what-is-calling-convention/)
- 《程序员的自我修养–链接，装载与库》
- [x86架构基础 | 一花一菩提，一云一世界 (kkutysllb.cn)](https://kkutysllb.cn/2019/04/21/x86架构基础/)

## C++ 语言

### Reference 

在编译器处理后就会变成 Pointer 。

- ***尽量使用 pass-by-value*** , 因为 reference 会绑定到临时变量上
- pass-by-value 可能会触发 copy constructor, 此时
  - 如果 argument ***不会被改变， 使用 const reference*** 
  - 如果 argument ***会被改变 (各种 in-place 算法)，使用 pointer***  

> The google coding standard says that you should ***only use const references,*** for the efficiency of not copying method arguments, and you should ***use pointers for non-const arguments that will be changed.*** This is good because at call sites you can see which arguments are being modified and which are not.

[Google C++ Coding Style:引用参数_求索-CSDN博客](https://blog.csdn.net/HorkyChen/article/details/47116491)

### Symbol Mangling and Linker in C++

前面说过 C 语言不支持 Overloading，那么 C++ 是如何支持 Overloading 的？

- 通过 **Symbol mangling**  。 这是由于 Linker 只支持 a global namespace (所以如果不修改函数的 identifier, 依旧会出现 C 语言的 function name 冲突)
- [Name mangling - Wikipedia](https://en.wikipedia.org/wiki/Name_mangling)
- [Lele's Memo: Name Mangling (cnlelema.github.io)](https://cnlelema.github.io/memo/en/compilers/basics/mangling/)
- [The Secret Life of C++: Symbol Mangling (mit.edu)](http://web.mit.edu/tibbetts/Public/inside-c/www/mangling.html)

具体 mangling 怎么做不重要，反正是编译器自动加上去的。 知道有这回事就可以了。

```cpp
int  f (void) { return 1; }
int  f (int)  { return 0; }
void g (void) { int i = f(), j = f(0); }
```

C++会自动对函数 identifier 修饰 (在函数 identifier 的基础上加上 argument type 等信息)

```cpp
int  __f_v (void) { return 1; }
int  __f_i (int)  { return 0; } 
void __g_v (void) { int i = __f_v(), j = __f_i(0); }
```

更加复杂的例子可以看 [The Secret Life of C++: Symbol Mangling (mit.edu)](http://web.mit.edu/tibbetts/Public/inside-c/www/mangling.html)

例如如下的 function prototype 是如何 name mangling 的

```cpp
// function prototype 
int Something::Inside::Deeper::deeperMethod(void)
// the actual function name seen by the Linker in C++
_ZN9Something6Inside6Deeper10deepMethodEv
```

但是 **C 的公用库没有 C++ name mangling** ，C++ 如何使用 C 的公用库呢 ***(C++ 如何 link 一个 C 函数)***？   即 C/C++ compatibility

可以使用如下 **C++ idiom** (idiom 译作 惯用法, 有一个书叫 ***《more C++ idioms》*** 专门介绍这类奇淫技巧)

会告诉 C++ 编译器不要去 mangle 里面的东西。

```cpp
#ifdef __cplusplus
extern "C" {
    ...
}
#endif
```

[The Secret Life of C++: Symbol Mangling (mit.edu)](http://web.mit.edu/tibbetts/Public/inside-c/www/mangling.html) 

需要注意 

- global variables 本来就在同一个 namespace 里面，不会出现 mangling(混乱) ，所以不需要 `extern "C"` 。这就是为什么 `extern "C"` 是有 scope/block 
- *没有 `extern` 的 constant global variables* 是 implicitly static ，所以 C++ 编译会自动 symbol mangling 

### Struct and Class 

C++的 struct 和 class 本质是一样的。

C++ 的 struct 和 class 的内存分配？？？

TODO: 这一章不完整，关于 VTable 处还需要补充。

#### Temporary Objects

Temporary Objects as Arguments: 当没有使用 reference/pointer 传入参数的时候

- When passing a temporary object as an argument, the caller must make space on the stack, call the constructor, pass a reference/pointer to the object, and then call the destructor when the life of the object is over. It could also be allocated on the heap

Temporary Objects as Return Values: 返回本地对象

- When returning an object from a function, if the object is non-trivial, than the caller allocates temporary space and passes a pointer to the space as a first argument to the function. The function calls the constructor. The caller is responsible for calling the destructor when the object is no longer needed.

这部分没怎么看懂。

#### Virtual Methods - Call by Pointer/Reference

How do virtual methods work? With a vtable. What a vtable? 

- `_ZTV8onefield` A pointer to the VTable of the onefield class. 

#### Virtual Methods - Overriding

As we can see, the subclass vtable has the same entries as the superclass, but where they are overridden we see the subclass methods replacing the superclass methods where appropriate.

#### Virtual Methods - Call by Reference 

When you call a virtual method on a local or temporary variable, the compiler really does know the type of the variable, and so it doesn't have to go through the vtable. This is a useful optimization. It can be seen in the basic-vtable example above.

It is also why you have to make sure to pass a subclass into a method expecting a superclass ***by reference***, not by copyconstructing an instance of the superclass. Becuase the later technique will cause the superclass functions to get called, rather than the subclass ones, even if they are virtual.

***处理超类的方法必须使用 call by reference*** ，且最好使用 `dyn_cast<>` 调用其 超类方法。

```cpp
struct Dog{
    Dog() {}
    virtual void name() const { std::cout << "a dog\n"; } 
}; 

struct GoldenRetriever : public Dog{
    GoldenRetriever() {}
    void name() const override { std::cout << "a golden retriever\n"; }
}; 

// pass a subclass by reference (to a method expecting a superclass)
void printNameOfDog(const Dog &d) { 
    d.name();
}
// pass by "value" , which will create a local object and call the method without going through the Vatable. 
void printNameOfDogBroken(const Dog d) {
    d.name();
}

int main(){ 
    GoldenRetriever g; 
    printNameOfDog(g);
    printNameOfDogBroken(g);
    // 输出: 
  	// 	a golden retriever
		// 	a dog
    return 0; 
}
```

#### Pure Virtual Methods

Pure virtual methods are just funny entries in the vtable. Specifically pointers to __cxa_pure_virtual. 

#### Virtual Destructors

You want a virtual destructor becuase otherwise someone might delete your object when they have a pointer to a superclass, and your destructor won't get run. Simple as that.

建议 destructor 声明为 virtual , 这是因为 constructor 本身一定是 virtual 的。为了符合 IIRA 原则，子类必须写配套的 desctructor 。这意味着 destructor 也应该是 virtual 的。

#### Subclasses

To see subclasses that add data values, we can look back at our subclass-vtable example: [subclass-vtable.cc](http://web.mit.edu/tibbetts/Public/inside-c/www/subclass-vtable.cc), [subclass-vtable.s](http://web.mit.edu/tibbetts/Public/inside-c/www/subclass-vtable.s), [subclass-vtable.listing](http://web.mit.edu/tibbetts/Public/inside-c/www/subclass-vtable.listing).

### Runtime Type Information and Casting

C++ objects in modern runtimes generally know their **types**, and can use this for a little bit of introspection(内省) and for checking for safe casts(安全转化)。 

注意 reflection(反射) 和 introspection(内省) 的区别 。

As we saw in our VTable examples, *there is a pointer to a **type info structure** in every vtable of every class.* This allows us to *look at this object at runtime* and find out details about the class we have. All we have to know is the vtable for an object, and we can, for example, find the name of its type.

可以从 VTable 查到实际的类型

#### RTTI

其中 `dynmaic_cast` 的源码。怎么用 `dynamic_cast` 可以查 cppreference 。

这里是为了明白 `dynamic_cast` 如何获得 **RunTime Type Information(RTTI)**   

```cpp
extern "C" void *
__dynamic_cast (const void *src_ptr,    // object started from
                const __class_type_info *src_type, // type of the starting object
                const __class_type_info *dst_type, // desired target type
                ptrdiff_t src2dst) // how src and dst are related
{
  const void *vtable = *static_cast <const void *const *> (src_ptr);
  const vtable_prefix *prefix =
      adjust_pointer <vtable_prefix> (vtable, 
				      -offsetof (vtable_prefix, origin));
  const void *whole_ptr =
      adjust_pointer <void> (src_ptr, prefix->whole_object);
  const __class_type_info *whole_type = prefix->whole_type;
  __class_type_info::__dyncast_result result;
  
  whole_type->__do_dyncast (src2dst, __class_type_info::__contained_public,
                            dst_type, whole_ptr, src_type, src_ptr, result);
  if (!result.dst_ptr)
    return NULL;
  if (contained_public_p (result.dst2src))
    // Src is known to be a public base of dst.
    return const_cast <void *> (result.dst_ptr);
  if (contained_public_p (__class_type_info::__sub_kind (result.whole2src & result.whole2dst)))
    // Both src and dst are known to be public bases of whole. Found a valid
    // cross cast.
    return const_cast <void *> (result.dst_ptr);
  if (contained_nonvirtual_p (result.whole2src))
    // Src is known to be a non-public nonvirtual base of whole, and not a
    // base of dst. Found an invalid cross cast, which cannot also be a down
    // cast
    return NULL;
  if (result.dst2src == __class_type_info::__unknown)
    result.dst2src = dst_type->__find_public_src (src2dst, result.dst_ptr,
                                                  src_type, src_ptr);
  if (contained_public_p (result.dst2src))
    // Found a valid down cast
    return const_cast <void *> (result.dst_ptr);
  // Must be an invalid down cast, or the cross cast wasn't bettered
  return NULL;
}
```

#### Using RTT directly

直接自己用 `type_info` 来判断 Runtime 信息

```cpp
#include <iostream>
#include <cxxabi.h>
#include <cassert>

class onefield{
private:
    int field;
public:
    virtual int getField() const { return this->field; }
    virtual void setField(int f) { 
        this->field = f; 
    }
}; 

class onefield_subclass : public onefield{
private:
    int otherField;
public:
    // overrides setField.
    virtual void setField(int f) override {
        onefield::setField(f); // the method in the superclass...
        otherField = f;       
    }
}; 

// to demangle a mangled identifier of a function. 
// 为 C++ 函数名解除名字修饰 
std::string demangle(const char* type) {
    int status;
    // demange 函数名
    char *buf = abi::__cxa_demangle(type, 0, 0, &status); 
    if (buf && status == 0) {
        std::string out = buf;
        free(buf);
        return out;
    }
    // faild to demangle the function name... 
    assert (status == 0); 
    return type;
}


int main(int argc, const char**argv) {
  onefield *ofp = new onefield_subclass;
  // 获得 runtime type 信息。
  const std::type_info& info = typeid(ofp);
  std::cout << "RTTI: " << info.name() << std::endl;
  std::cout << "RTTI: " << demangle(info.name()) << std::endl;
  return 0;
}
```

### Virtual Inheritance

#### Dreaded Diamond Problem

This is when we have a base class, a pair of derived classes, and we want a class that inherits from both derrived classes. 想一想 diamond 的形状。

![Why should I avoid multiple inheritance in C++? - Stack Overflow](DbexT.gif)

看不懂。[The Secret Life of C++: Virtual Inheritance (mit.edu)](http://web.mit.edu/tibbetts/Public/inside-c/www/virtual-inheritance.html)

 ***VTT stands for virtual-table table***, which means it's a table of vtables

- Virtual Base Classes in Memory
- Virtual Base Classes in the VTable
- How they are constructed
- Polymorphic Function Pointers

TODO: virtual inheritance 如何解决多继承中的多个 VTable 的问题？ 

## Initializing Globals

看一看 Global Object 如果有 constructor 和 destructor 时的 Assembly Code 会怎样。

那里太复杂了，没看懂。[The Secret Life of C++: Initializing Globals (mit.edu)](http://web.mit.edu/tibbetts/Public/inside-c/www/initializing-globals.html)

### Linker Magic

Basically, global constructors and destructors get "registered" and called at program start and shutdown, using the _init and _fini sections of the executable. Precisely how they get there is linker magic.

TODO: Figure out linker magic.

## Exceptions 

有时间再看。。。暂时来说 Exception Handling 的需要不太紧迫

[The Secret Life of C++: Exceptions (mit.edu)](http://web.mit.edu/tibbetts/Public/inside-c/www/exceptions.html)

TOD 有空再看

## Syntactic Sugar

[The Secret Life of C++: Syntactic Sugar (mit.edu)](http://web.mit.edu/tibbetts/Public/inside-c/www/sugar.html)

- Operator Overloading
- User Defined Literals
- Constexpr
- Intialization Lists
- Range based loops
- Type inference

为什么叫语法糖呢？

`constexpr` https://docs.microsoft.com/en-us/cpp/cpp/constexpr-cpp

> **constexpr** indicates that the value, or return value, is constant and, ***where possible, is computed at compile time.***

比如 `constexpr` 实际上没有多大意义。因为编译器有 constant folding 等等的优化。

TODO 有空再看

## Threading Support

C++11 开始有 native threading 支持。

TODO 有空再看

## Templates

[The Secret Life of C++: Templates (mit.edu)](http://web.mit.edu/tibbetts/Public/inside-c/www/templates.html)

**C++ 是 static typing** ，这句话要由头记到尾。所以 Templates 肯定也是类似 Go 语言那样，通过超多的 overloading 来实现的 generic typing 的。

#### Template Parameter & Template specialization 

```cpp
template <typename T>
T max(T x, T y) {
    if (x > y) return x;
    else return y;
}

// Template Specialization
// 通过 specify templeate argument 来选择更快捷的实现方式 (不需要判断)。
template <>
bool max<bool>(bool x, bool y) {
    return (x || y);
}
```

The symbol list generated by the following program which uses the template defined above. 

```cpp
struct my_struct {
    int _field;
    my_struct(int field) : _field(field) {}
    bool operator>(const my_struct &rhs) const;
};
bool my_struct::operator>(const my_struct &rhs) const {
    return _field > rhs._field;
}

// 
int main(int argc, const char **argv) {
    // int
    int i = max(2, 3);
    // double
    double d = max (2.3, 3.5);
    // my_struct
    my_struct x(37);
    my_struct y(12);
    my_struct m = max (x, y);
    // bool
    bool bx = true;
    bool by = false;
    bool b = max(bx, by);
  
    return i;
}
```

**Symbol list:**

```
_Z3maxIiET_S0_S0_
_Z3maxIdET_S0_S0_
_Z3maxI9my_structET_S1_S1_
_Z3maxIbET_S0_S0_
```

可以看到实际上生成了四个函数 (在 LLVM IR Bitcode 看的更明显)

#### Templated Class Member Methods

需要知道 Linker 只有一个 global namespace 。

***这意味着实际上 class method 也是通过 symbol mangling 区分的***。于是可以得到不同类别的 symbol 

```
@_ZN9my_structIdE14set_field_fromIxEEvPT_
```

对应 ``my_struct<double>::set_field_from<long long*>(void)`` 

```cpp
template <typename T1>
struct my_struct {
    T1 _field;
    my_struct(T1 field) : _field(field) {}

    template <typename T2>
    void set_field_from (T2* value) {
        _field = *value; 
    }
};

int main() {
    my_struct<double> f1(4.9);
    cout << "f1._field=" << f1._field << "\n";

    long long i = 5; 
    f1.set_field_from(&i);
    cout << "f1._field=" << f1._field << "\n";
}
```

And of course **there is no way to have a templated virtual method**, which is mildly annoying but somewhat understandable. 

![image-20220209202605109](image-20220209202605109.png)

虽然**不存在 virtual templated member function**  ，但可以一开始就生命所有 template parameter。

```cpp
template <typename T1, typename T2>
struct my_struct {
    T1 _field;
    my_struct(T1 field) : _field(field) {}

    virtual void set_field_from (T2* value) {
        _field = *value; 
    }
};

int main() {
    my_struct<double, long long> f1(4.9);
    cout << "f1._field=" << f1._field << "\n";

    long long i = 5; 
    f1.set_field_from(&i);
    cout << "f1._field=" << f1._field << "\n";
}
```

#### Templating Gym Practices 模版体操练习

> Templating is just ***pattern matching***. 

It means we can do a lot of funny things (like magic gymnastics). 

[Passing String Literals as Template Parameters in C++20 | Kevin Hartman (ctrpeach.io)](https://ctrpeach.io/posts/cpp20-string-literal-template-parameters/)

[c++ - C-Style Strings as template arguments? - Stack Overflow](https://stackoverflow.com/questions/1826464/c-style-strings-as-template-arguments/1826505)

```cpp
// Since the `global_string` is evaluated at the compile time, 
// this is the reason why the magic can happend.
template <char const *str>
void Print(){
    printf("%s\n", str);
}

const char global_string[] = "Hello World"; // inplicitly static string literals.  
int main() {
    Print<global_string>();
}
```

***Recursive Templating & Fibonacci numbers*** at Compile Time

[The Secret Life of C++: Templates (mit.edu)](http://web.mit.edu/tibbetts/Public/inside-c/www/templates.html)

我们能在 Compiler Time 就把 Fibonacci Number 展开 ***(记住 Templating 是在 Compile Time)***

```cpp
// Fibonacci numbers using template math.
template <int I>
struct fibonacci {
    static const int value = (fibonacci<I-1>::value +
                              fibonacci<I-2>::value);
};

template <>
struct fibonacci<0> {
    static const int value = 1;
};
template <>
struct fibonacci<1> {
    static const int value = 1;
};

int main () {
    const int arg = 17;

    int result = fibonacci<arg>::value;
    std::cout << "fibonacci<" << arg << ">::value = "
              << result << std::endl;
}
```

- 由于优化原因，编译器知道 **`const int arg` 是 RValue** ， 无论在哪里定义都会自动替换掉。
  - 如果将 `const` 去掉就会出错。原因很简单， ***Templating is in compile time***
- 可以看 `    movl    $2584, -8(%rbp)                 ## imm = 0xA18` 就是答案。
  - 实际的 templating depth 比想象中要浅，而且不会随着数字变大而变大。估计编译器有特别的实现，由于时间不够，下次有时间再深入研究。
- 至此，**动态(evaluate at runtime)** 和 **静态(evaluate at compile time)** 的意义就明显了。

TODO: Pointer to modern template metaprogramming link.

C++ Templating 这一章很有趣。
Static Typing 的 Generic Typing 策略 跟 Python 之类 dynamic typing 的 Duck Tying 稍微有点不一样。 

主要就是 Static Tying System 能够做一些很奇怪的事情 (比如 TypeScript) 

> TypeScript provides static typing through type annotations - [TypeScript - Wikipedia](https://en.wikipedia.org/wiki/TypeScript)

## Anonymous Functions and Captures

[The Secret Life of C++: Anonymous Functions and Captures (mit.edu)](http://web.mit.edu/tibbetts/Public/inside-c/www/closures.html)

**Lambda Function:** 

```cpp
#include <iostream>

int apply(const std::function<int (int,int)> &f);

void anonFunction() {
  auto f = [](int a, int b) -> int { return a + b; };
  int n = apply(f);
  std::cout << "anonFunction = " << n << std::endl;
}
int apply(const std::function<int (int,int)> &f) {
  return f(1, 2);
}
```

实际上 `f` 的类型是 (可以 `-S` 查看源码，**就在 `call` 后面)** 

其中 `$_0` 是 无名函数的实际名字。假设真的出现了 `f` 的函数，也不会冲突)。 

```cpp
std::__1::function<int (int, int)>::function<anonFunction()::$_0>(anonFunction()::$_0, std::__1::enable_if<(__callable<anonFunction()::$_0>::value) && (!(is_same<anonFunction()::$_0, std::__1::function<int (int, int)> >::value)), void>::type*)
```

下次 Debug 的时候看到这种信息就淡定很多了。

**Anonymous Function with Capture:** 

主要是 `[=]`  和 `[&]` 两种区别 [Lambda expressions in C++ | Microsoft Docs](https://docs.microsoft.com/en-us/cpp/cpp/lambda-expressions-in-cpp?view=msvc-170)

**`[=]` capture by value**  

在 `f` 创建的时候 capture , 后面发生什么都不会管。

```cpp
#include <iostream>

static int apply(const std::function<int (int,int)> &f){
  return f(0, 0);
}

int main() {
  int x = 12;
  auto f = [=](int a, int b) -> int { return a + b + x; };
  
  int first = apply(f);
  x = 55;
  int second = apply(f);
  // 打印出 "12" 和 "12"
  std::cout << "captureFunction first=" << first << " second=" << second << std::endl;
}
```

`[&]` capture by **reference on the locak stack** 

```cpp
#include <iostream>

int x = 100; 

static int apply(const std::function<int (int,int)> &f){
  return f(0, 0);
}

int main() {
  int x = 12;
  auto f = [&](int a, int b) -> int { return a + b + x; };
  
  int first = apply(f);
  x = 55;
  int second = apply(f);
  // 打印出 "12" 和 "55"
  std::cout << "captureFunction first=" << first << " second=" << second << std::endl;
}
```

下面会更加清楚展示 **Capture By Reference 的原理**

- 答案就比较明显了，是**通过 local stack frame 的相对偏移位置进行访问**。

```cpp

static int apply(const std::function<int (int,int)> &f){
  return f(0, 0);
}

const std::function<int (int,int)> makeFunction(int x_) {
  int x = x_; 
  auto f = [&](int a, int b) -> int { return a + b + x; };
  return f; 
}

int main() {
  auto f = makeFunction(12);
  int f1 = apply(f);

  auto g = makeFunction(30);
  int f2 = apply(f);
  int g1 = apply(g);
	
  // 
  // 打印出 captureError f1=12 f2=30 g1=30
  std::cout << "captureError f1=" << f1 << " f2=" << f2
            << " g1=" << g1 << std::endl;
}

```

从 Assmebly Code 也能看到 

```assembly
__Z12makeFunctioni:                     ## @_Z12makeFunctioni
...
	leaq	-16(%rbp), %rax
...
	.cfi_endproc
                                        ## -- End function
```

如果把 `makeFunction` 改成

```cpp
const std::function<int (int,int)> makeFunction(int x_) {
  int arr[100]; 
  int x = x_; 
  auto f = [&](int a, int b) -> int { return a + b + x; };
  return f; 
}
```

可以发现汇编源码变成(地址偏移量发生了变化，按理说应该只是增加了 400 ，另外的 16 不知道怎么来的，下次再研究)。

```cpp
__Z12makeFunctioni:                     ## @_Z12makeFunctioni
...
	leaq	-432(%rbp), %rax
...
	.cfi_endproc
                                        ## -- End function
```

至于 Capture by Value 的汇编代码太长，以后有机会再研究，反正不知道 Capture by Value 并不会通过地址偏移量来读取 local stack 就差不多了。



