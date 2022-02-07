# Ruby Day 2 

### Function 

函数是 Object ，于是 High-order function 就顺理成章了。
注意 Function 需要返回一个值，如果没有指定就是最后一个。

### Arrays 

有非常多的 methods ，根据 Duck Typing, 可以做非常多的数据结构。

难点是 enumerator ，还有 index 等等。 

### Hashes

需要了解 Arrary 和 hashes 之间的相互转换。 

比如 `*` splat 操作符 (类似 split ) 

[Using splats to build up and tear apart arrays in Ruby - Honeybadger Developer Blog](https://www.honeybadger.io/blog/ruby-splat-array-manipulation-destructuring/)

```ruby
def go(x, y)
  ... 
end

point = [12, 10]
go(*point)
```

And don't forget that you can use a double splat for new style keyword arguments:

```ruby
def go(x:, y:)
end

point = { x: 100, y: 200 }
go(**point)
```



### Cdoe Block & Yield 

了解如何传入 Code Block `&` 操作符

了解如何调用 Code Block `.call`

了解 `yield` 有什么意义

### Classes 

了解 Ruby 的单继承 

了解 Ruby 如何利用 Module / Mixin 解决需要 Java 的 Interface 和 C++ 多继承问题。

了解 Ruby 命名规范

了解 Ruby 各种类的 `superclass` 关系链

了解 getter 和 setter 以及 att_accessor 

[Week 5 Technical Blog - Ruby Classes (cerinman.github.io)](https://cerinman.github.io/blog-posts/week5_technical.html)

[Ruby Programming Guide (peruzal.com)](https://guides.peruzal.com/ruby-guide/)

### Enumerable & Comparable Mixins

根据字面意思 (和 Duck Typing)，我们知道

Enumerable 的 class 有  `each` 

Comparable 的 class 有 `<=>` 

这就是 Ruby 美妙的地方，很简洁地描述了类的行为。

了解 `sort`

了解 `any?` , `all?`

了解 `collect` 和 `map` ，以及与 `each` 和 `each_slice`的区别

了解 `find`

了解 `select` 和 `find_all` 

了解 `inject` 和 `reduce` ，

为什么 Ruby 非常多同名的方法 ? 因为 Ruby 想取悦程序员 (但实际上以 Functional Programming 的术语命名应该更加合理，没有必要去取悦来自别的领域的程序员。我终于明白为什么 Ruby 衰落了。)  [alias - Is inject the same thing as reduce in ruby? - Stack Overflow](https://stackoverflow.com/questions/13813243/is-inject-the-same-thing-as-reduce-in-ruby)

## Day 2 练习

读取文件
```ruby 
# 
f = File.open(filename, 'w')
f.write(to_s)
# 
f = File.open(filename, 'w') { f.write(to_s) }
```
Hash 转换 (查 Ruby 的文档, 查 `array` 之类的关键字)
```ruby 
s = {:k1 => 'fuck', :k2 => 'you'}
# to flatten a hash to list 
s.flatten 
# keys and vlaues 
s.keys 
s.values 

# from array to hash 
# https://stackoverflow.com/questions/4028329/array-to-hash-ruby

# from key-val pairs 
[[:k1, 'fuck'], [:k2, 'you']].to_h
# to inverse the operations 
s = [:k1, 'fuck', :k2, 'you']
Hash[*s] # truns a list into argument list 
Hash[s.each_slice(2).t_a]
s.each_slice(2).to_a.to_h 
```
遍历哈希
```ruby 
s.each {|k, v| puts "#{k}=>#{v}"}
```
array 可以当 stack, queue, heap ? 

使用 `each` 作为 iterator 
```ruby 
numbers = (0..15).to_a

numbers.each do |n|
    p numbers[(n)..(n+3)] if n % 4 == 0
end

numbers.each_slice(4) {|ns| p ns }
```

### 课后作业

[seven-languages/day2.rb at master · bekk/seven-languages (github.com)](https://github.com/bekk/seven-languages/blob/master/ruby/kvalle/day2.rb)

```ruby
numbers = (0..15).to_a
numbers.each do |n|
    p numbers[(n)..(n+3)] if n % 4 == 0
end

numbers.each_slice(4) {|ns| p ns }
```

```ruby
class Tree
    attr_accessor :children, :node_name
    
    def initialize(tree)
        @node_name = tree.keys[0]
      	# |sub| 是 [key, val] 的 array, 用 splat 
        @children = tree[@node_name].map do |sub| 
            subtree = Hash[*sub] 		
            Tree.new(subtree)
        end
    end

    def visit_all(&block)
        visit &block
        children.each {|c| c.visit_all &block}
    end
    
    def visit(&block)
        block.call self
    end
end

ruby_tree = Tree.new({"grandpa"=>
                        {"dad"=>{"child 2"=>{}, "child 1"=>{}},
                         "uncle"=>{"child 4"=>{}, "child 3"=>{}}}})

puts "visiting root"
ruby_tree.visit {|node| puts node.node_name}
puts

puts "visiting entire tree"
ruby_tree.visit_all {|node| puts node.node_name}
puts
```

Pattern Matching 

```cpp
def ruby_grep(filename, pattern)
    regexp = Regexp.new(pattern)
    File.open(filename, 'r') do |file|
        file.each_line {|line| puts line if regexp =~ line}
    end
end

ruby_grep('day2.txt', 'red')
```

