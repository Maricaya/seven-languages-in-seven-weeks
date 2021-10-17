# 定义类
# puts 4.class # Integer
# puts 4.class.superclass # Numeric
# puts 4.class.superclass.superclass # Object
# puts 4.class.superclass.superclass.superclass # BasicObject
# puts 4.class.superclass.superclass.superclass.superclass # nil

# wrong
# it's returning the string 'a' after the first pass,
# which becomes res in the next pass and you end up calling the string's []= method.
# %w[a b].inject({}) {|res,e| res[e] = e; res}

# right
p %w[a b].inject({}) { |res, e| res[e] = e; res }

class Tree
  attr :children, :node_name

  def initialize(data = {})
    @children = []
    data.each do |key, value|
      @node_name = key
      @children = value.inject([]) { |res, (k, r)|
        res.push(Tree.new(k => r))
      }
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
family_tree = Tree.new(
  { 'grandpa' =>
      { 'dad' => {}
        # { 'child 1' => {}, 'child 2' => {} },
        # 'uncle' =>
        #   { 'child 3' => {}, 'child 4' => {} }
      }
  })
family_tree.visit { |node| puts node.node_name } # Ruby
puts

puts "Visiting entire tree"
family_tree.visit_all { |node| puts node.node_name } # Ruby Reia MacRuby
