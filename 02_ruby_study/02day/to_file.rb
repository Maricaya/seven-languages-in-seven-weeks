module ToFile
  def filename
    "object_#{self.object_id}.md"
  end

  def to_f # 把 to_s 方法的输出写入文件
    File.open(filename, 'w') { |f| f.write(to_s) }
  end
end

# mixin
class Person
  include ToFile
  attr :name

  def initialize(name)
    @name = name
  end

  def to_s
    name
  end
end

puts Person.new('#haha').to_f

# 模块、可枚举和集合
puts 'begin' <=> 'end'
puts 'same' <=> 'same'

a = [5, 3, 4, 1]
a.sort
a.any? { |i| i > 6 }
a.all? { |i| i > 4 }