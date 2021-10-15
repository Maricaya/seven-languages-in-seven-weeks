# 定义类
# puts 4.class # Integer
# puts 4.class.superclass # Numeric
# puts 4.class.superclass.superclass # Object
# puts 4.class.superclass.superclass.superclass # BasicObject
# puts 4.class.superclass.superclass.superclass.superclass # nil

class Tree
  attr :children, :node_name

  def initialize(name, children = {})
    @node_name = name
    @children = []
    children[children.keys[0]].each do |key, value|
      puts key
      puts value
      @children.push(Tree.new({ key => value }))
    end
  end

  def visit_all(&block)
    visit &block
    children.each { |c| c.visit_all &block }
  end

  def visit(&block)
    block.call self
  end
end

puts "Visiting a node"
family_tree = Tree.new("family",
                       { 'grandpa' =>
                           { 'dad' =>
                               { 'child 1' => {}, 'child 2' => {} },
                             'uncle' =>
                               { 'child 3' => {}, 'child 4' => {} }
                           }
                       })
family_tree.visit { |node| puts node.node_name } # Ruby
puts

puts "Visiting entire tree"
family_tree.visit_all { |node| puts node.node_name } # Ruby Reia MacRuby
