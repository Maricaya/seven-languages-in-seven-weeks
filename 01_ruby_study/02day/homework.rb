# 1
array = []
16.times do |i|
  array.push(i)
end

array.each { |num|
  i = array.index(num)
  print " #{num} "
  if (i + 1) % 4 == 0
    puts
  end
}

array.each_slice(4) { |num| p num }

# 2
class Tree
  attr :children, :node_name

  def initialize(name, children = [])
    @children = children
    @node_name = name
  end

  def visit_all(&block)
    visit &block
    children.each { |c| c.visit_all &block }
  end

  def visit(&block)
    block.call self
  end
end

ruby_tree = Tree.new("family",
                     { 'grandpa' =>
      { 'dad' =>
          { 'child 1' => {}, 'child 2' => {} },
        'uncle' =>
          { 'child 3' => {}, 'child 4' => {} }
      }
  })
ruby_tree.visit { |node| puts node.node_name } # Ruby
puts
