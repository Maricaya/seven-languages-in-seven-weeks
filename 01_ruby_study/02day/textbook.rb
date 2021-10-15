animals = %w[lions tigers bears]
puts animals

# 散列表 hash table
def tell_the_truth(options = {})
  if options[:profession] == :lawyer
    'it could be believed that is almost certainly not false'
  else
    true
  end
end

puts tell_the_truth
puts tell_the_truth :profession => :lawyer

# 代码块 Code block 和 yield
3.times { puts 'hiya there' }

animals.each { |a| puts a }

class Integer
  def my_times
    i = self
    while i > 0
      i = i - 1
      yield # 调用传入的代码块
    end
  end
end

3.my_times { puts 'hi hi' }

def call_block(&block)
  # 和 yield 做的事情一样
  block.call
end

def pass_block(&block)
  call_block(&block)
end

pass_block { puts 'hello, block2' }
