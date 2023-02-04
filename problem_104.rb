# Definition for a binary tree node.
class TreeNode
    attr_accessor :val, :left, :right
    def initialize(val = 0, left = nil, right = nil)
        @val = val
        @left = left
        @right = right
    end
end
# @param {TreeNode} root
# @return {Integer}
def max_depth(root)
    return 0 if root.nil?

    [calculate_depth(root.left, 1), calculate_depth(root.right, 1)].max 
end

def calculate_depth(node, index)
    return index if node.nil?

    [calculate_depth(node.left, index+1), calculate_depth(node.right, index+1)].max
end

t1 = TreeNode.new(7, nil, nil)
t2 = TreeNode.new(15, nil, nil)
t3 = TreeNode.new(20, t1, t2)
t4 = TreeNode.new(9, nil, nil)
t5 = TreeNode.new(3, t4, t3)

p max_depth(t5)

t4 = TreeNode.new(2, nil, nil)
t5 = TreeNode.new(1, t4, nil)

p max_depth(t5)