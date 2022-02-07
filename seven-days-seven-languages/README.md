# Seven Days Seven Languages

## 编程范式

这门课的目的不是学习各种编程语言的语法。而是去**学习各种编程语言的设计理念**，为学习编译原理奠定更好的基础。比如 

- OOP 的多态有多少种解决方案？
- 如何解决 concurrency 问题 ? 

### Type Model  
- Strong 和 Weak 
- Dynamic 和 Static 的本质是 flexibility 和 execution safety 的 trade-off. 

Dynamically typed means that types are bound at execution time rather than compile time.


### Programming Model 
- **Procedural** -> C, Pascal 
- **Object-Oriented** Programming -> Ruby 
- **Functional** Programming -> Haskell 
- **Prototype** Language -> JavaScript, Io, Lua 
- Logic-based -> Prolog 

Object-oriented means the language supports **encapsulation** (data and behavior are packaged together), **inheritance** through classes (object types are organized in a class tree), and **polymorphism** (objects can take many forms). 


### Decision Constructs and Core Data Structure 
- how program make decisions ? (`if, else`)
- Collections

[bekk/seven-languages: Sandbox for Seven Languages in Seven Weeks (github.com)](https://github.com/bekk/seven-languages)

## 编程语言

各种语言的 BNF 形式 (对于写 Scanner 和 Parser 有很大作用)，特别是 Lexical Analysis 要仔细读。

[antlr/grammars-v4: Grammars written for ANTLR v4; expectation that the grammars are free of actions. (github.com)](https://github.com/antlr/grammars-v4)

虽然某些编程语言会强调所谓的 “多种写法”  (比如 Ruby) ，但是**最好按照 Style Guide 使用一部分 subset 就可以**了，没必要研究奇淫技巧。规定越多，写起来反而越轻松。

除了看 CFG 以外，还可以看 Standard，比如 C++ Standard, Haskell Report 。

一般看法是 ***Haskell > C++ > Scala > Python*** > Rust > Go 

(Python 库比较多，Scala 可以直接用 Java 库，C++ 也有很多现成开发工具，Haskell 就是并行计算)

#### Ruby 

- [x] [day 1](./ruby-day1.md) 
- [x] [day 2](./ruby-day2.md) 
- [x] [day 3](./ruby-day3.md) 
- [x] [summary](./ruby-summary.md) 

#### C++ / CXX

[Google C++ Style Guide](https://google.github.io/styleguide/cppguide.html)

- [ ] [day 1](./scala-day1.md) 

- [ ] [day 2](./scala-day2.md) 

- [ ] [day 3](./scala-day3.md) 

- [ ] [summary](./scala-summary.md) 

#### Scala 

[databricks/scala-style-guide: Databricks Scala Coding Style Guide (github.com)](https://github.com/databricks/scala-style-guide)

- [ ] [day 1](./scala-day1.md) 

- [ ] [day 2](./scala-day2.md) 

- [ ] [day 3](./scala-day3.md) 

- [ ] [summary](./scala-summary.md) 

#### Haskell 

Haskell 需要学会范畴论 + Haskell 数据结构 。

[Haskell Style Guide (anu.edu.au)](https://cs.anu.edu.au/courses/comp1100/resources/04-style/)

[haskell-style-guide/haskell-style.md at master · tibbe/haskell-style-guide (github.com)](https://github.com/tibbe/haskell-style-guide/blob/master/haskell-style.md)

- [ ] [day 1](./haskll-day1.md) 

- [ ] [day 2](./haskll-day2.md) 

- [ ] [day 3](./haskll-day3.md) 

- [ ] [summary](./haskll-summary.md) 

#### Io

- [ ] [day 1](./io-day1.md)

- [ ] [day 2](./io-day2.md)

- [ ] [day 3](./io-day3.md) 

- [ ] [summary](./io-summary.md) 

#### Prolog 

- [ ] [day 1](./prolog-day1.md) 

- [ ] [day 2](./prolog-day2.md) 

- [ ] [day 3](./prolog-day3.md) 

- [ ] [summary](./prolog-summary.md) 

#### Erlang 

- [ ] [day 1](./erlang-day1.md) 

- [ ] [day 2](./erlang-day2.md) 

- [ ] [day 3](./erlang-day3.md) 

- [ ] [summary](./erlang-summary.md) 

#### Clojure

- [ ] [day 1](./clojure-day1.md) 

- [ ] [day 2](./clojure-day2.md) 

- [ ] [day 3](./clojure-day3.md) 

- [ ] [summary](./clojure-summary.md) 





