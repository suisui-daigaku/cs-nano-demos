


目前主要有两种静态检查工具
- 基于 AST 的静态检测工具
	- clang-tidy 
	- llvm-format 
	- [NASA-SW-VnV/ikos: Static analyzer for C/C++ based on the theory of Abstract Interpretation. (github.com)](https://github.com/NASA-SW-VnV/ikos)
- 基于 Regular Expression 的检测工具
	- Google 的 cpplint 
都非常值得研究。
[深入研究Clang(十三) clang-tidy简介 - 知乎 (zhihu.com)](https://zhuanlan.zhihu.com/p/102248131)
[MaskRay/ccls: C/C++/ObjC language server supporting cross references, hierarchies, completion and semantic highlighting (github.com)](https://github.com/MaskRay/ccls)




即然有 TypeScript ，为什么没有 TypePy ? 

第一种想法是 Static Type Checker/Validator ，相关项目有
- [typepy · PyPI](https://pypi.org/project/typepy/)
- [Python Type Hints – José Padilla (jpadilla.com)](https://jpadilla.com/2018/03/23/python-type-hints/)

Python 自己有 Generic Type ，不然用 Code Generation 实现 Generic Type 也很不错。
[Python Type Hints – José Padilla (jpadilla.com)](https://jpadilla.com/2018/03/23/python-type-hints/) 

关于 Code Generation (类似 C++ Templelate 的原理)
[taylorchu/generic: A code generation tool to enable generics in go (github.com)](https://github.com/taylorchu/generic)

关于 C++ 的 Style Issues 的问题，这也是一个非常好的项目，总共 6000 行代码，结构非常简单。
[cpplint/cpplint: Static code checker for C++ (github.com)](https://github.com/cpplint/cpplint)
[styleguide/cpplint at gh-pages · google/styleguide (github.com)](https://github.com/google/styleguide/tree/gh-pages/cpplint)
> This is automated checker to make sure a C++ file follows Google's C++ style
guide ([https://google.github.io/styleguide/cppguide.html](https://google.github.io/styleguide/cppguide.html)). As it
heavily relies on regular expressions, cpplint.py won't catch all violations of
the style guide and will very occasionally report a false positive. There is a
list of things we currently don't handle very well at the top of cpplint.py,
and we welcome patches to improve it.


关于 C++ 泛型编程
[一个泛型的示例 - swap函数 | 左耳听风 (doc.vercel.app)](https://doc.vercel.app/air/article/301.html#%E4%BB%8Ec%E8%AF%AD%E8%A8%80%E7%9A%84%E4%B8%80%E4%B8%AA%E7%AE%80%E5%8D%95%E4%BE%8B%E5%AD%90%E8%AF%B4%E8%B5%B7)
(左耳听风的专栏非常好，里面有很多文章非常受用)
不懂什么是**类型系统**？
快来看看啊啊啊啊啊啊。

![[Pasted image 20220124220933.png]]

按照这种说法，Scheme 