# Ruby Day 1 

Ruby 使用类似 Python `pip` 的包管理工具 (libraries), 叫 `gem` 。
Bundler 应该是类似 node.js 的 `json` 文件，可以管理一堆 `gem` 包。
- The Ruby API
- The free online version of Programming Ruby: *The Pragmatic Pro- grammer’s Guide*



### Everything in Ruby is an object 
Ruby 是 pure object-oriented programming language. 

>  **Everything in Ruby is an object.** 

根据这句话可以查看对象的 class 和 method 
```ruby
4.class
4.methods 
=> [:next, :**, :<=>, :<<, :>>, :<=, :>=, :==, :===,...
```
我们知道所有 method 都应该可以通过 **dot operator** 访问
```ruby
4.next 
=> 5
4.==(4)
=> true 
```

### Condition & Loop 
Ruby 好骚。
- 可以写一行代码 
-  `if` 和  `unless` 
- `while` 和 `until` 
```ruby 
puts 'This appears to be false.' unless x == 4
puts 'This appears to be true.' if x == 4
puts 'This appears to be true.' if not true
puts 'This appears to be true.' if !true

if x == 4  
	puts 'This appears to be true.'  
end


x = x + 1 while x < 10
x = x - 1 until x == 1

while x < 10
	x=x+1
	puts x
end
```

注意除了 `nil` 和 `false` 以外，所有求值都是 `true` (小心 C++)
```ruby 
puts 'This appears to be true.' if 0
This appears to be true.
=> nil 
```


### Logical Operator 
`||` 会短路求值， `|` 会求整个表达式
```ruby 
true || fuck
=> true

true | fuck
=> `<main>': undefined local variable or method `fuck' for main:Object (NameError)
	from /usr/local/Cellar/ruby/3.0.3/lib/ruby/gems/3.0.0/gems/irb-1.3.5/exe/irb:11:in `<top (required)>'
	from /usr/local/opt/ruby/bin/irb:23:in `load'
	from /usr/local/opt/ruby/bin/irb:23:in `<main>'
irb(main):017:0>
```

### Dynamic Typing & Duck Type 
Ruby 在 runtime 才会检查类型，所以 Ruby 是 Dynamic typing. 

比较值得注意的是 Ruby 属于 Strongly Typed ，遇到类型冲突崩溃。
(实际上可以用修改 Object 的 methods 来强行避免类型冲突，但一般人不会这么做，所以 Ruby 在正常情况下是 Strongly Typed) 
```ruby 
4 + 'four'
=> in `+': String can't be coerced into Integer (TypeError)
	from (irb):32:in `<main>'
	from /usr/local/Cellar/ruby/3.0.3/lib/ruby/gems/3.0.0/gems/irb-1.3.5/exe/irb:11:in `<top (required)>'
	from /usr/local/opt/ruby/bin/irb:23:in `load'
	from /usr/local/opt/ruby/bin/irb:23:in `<main>'
```

为什么 Dynamic Typing 有好处？
因为可以实现 Duck Type (只要能呱呱叫的，我们都认为是鸭子)
如果两个类能够**以相同的方式被使用**，两个类则必须有**相同的接口**。
这里有两种实现方式： 继承 和 Duck Type 
- 两个类**继承自同一个父类**
```cpp
vector<Animal*> pets;
pets.push_back(new Cat());
pets.push_back(new Dog()); 
// 
for (auto p : pets){
	p->eat(); 
}
```
- Duck Type 
```ruby 
a = ['100', 100.0]
i = 0
while i < a.size
	puts a[i].to_i
	i = i + 1
end 
```
这里也有一个有趣的推论: 只要能呱呱叫的，我们都认为是鸭子。
这意味着 只要有 `push` 和 `pop` 就是 Stack (确实可以这么做) 。

### String Substitution

了解 **单引号** 和 **双引号** 的区别

### Regular Expression 

https://ruby-doc.org/core-2.5.1/Regexp.html

### Ranges

Ruby 非常多**语法糖**，可以写出很多优美的代码。 Range 就是最好的例子。 

https://ruby-doc.org/core-2.5.1/Range.html