# Ruby Day 3 

了解如何给标准类注入自定义方法

了解 `method_missing` 

了解 `Module` 如何实践 metaprogramming (可以选择性启用某些方法?) 

## 课后练习

调用 `CsvRow` ， 其允许 `missing_method` 查询 row 的 column 数据。

其中 `|row|` 是由 `yield` 产生的 `CsvRow` 对象。

文本文件 `rubycsv.txt` 。

```
one, two
lions, tigers
bears, oh my
```

代码

```ruby 
module ActsAsCsv
    def self.included(base)
        base.extend ClassMethods
    end 

    module ClassMethods
        def acts_as_csv
            include InstanceMethods
        end 
    end 
    
    module InstanceMethods
        def read
            @csv_contents = []
            # the filename is the class name.txt 
            filename = self.class.to_s.downcase + '.txt' 
            file = File.new(filename)
            @headers = file.gets.chomp.split(', ')

            file.each do |line|
                @csv_contents << line.chomp.split(', ')
            end 
        end
        
        def each(&block)
            @csv_contents.each do |row|
              yield CsvRow.new(@headers, row)
            end
        end

        attr_accessor :csv_contents, :headers
        def initialize
            read
        end 

        class CsvRow
            def initialize(headers, data)
                @headers = headers
                @data = data
            end 
    
            def method_missing(name, *args, &block)
                index = @headers.index(name.to_s)
                @data[index] unless index.nil? # if not 
            end 
        end

    end 

end


class RubyCsv # no inheritance! You can mix it in include ActsAsCsv
    include ActsAsCsv
    acts_as_csv
end

m = RubyCsv.new
# puts m.headers.inspect
# puts m.csv_contents.inspect


m.each {|row| puts row.one} 
```

