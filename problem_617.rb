# Definition for a binary tree node.
class TreeNode
    attr_accessor :val, :left, :right
    def initialize(val = 0, left = nil, right = nil)
        @val = val
        @left = left
        @right = right
    end
end
# @param {TreeNode} root1
# @param {TreeNode} root2
# @return {TreeNode}
def merge_trees(root1, root2)
    return root1 if root2.nil?
    return root2 if root1.nil?

    root1.val = root1.val + root2.val
    root1.left = merge_trees(root1.left, root2.left)
    root1.right = merge_trees(root1.right, root2.right)
    root1
end

def merge_node(node1, node2)
    node1.val = node1.val + node2.val
    node1.left = merge_node(node1.left, node2.left)
    node1.right = merge_node(node1.right, node2.right)
end

n1 = TreeNode.new(5)
n2 = TreeNode.new(2)
n3 = TreeNode.new(3, n1)
n4 = TreeNode.new(1, n3, n2)

n5 = TreeNode.new(7)
n6 = TreeNode.new(4)
n7 = TreeNode.new(3, nil, n5)
n8 = TreeNode.new(1, nil, n6)
n9 = TreeNode.new(2, n8, n7)

p merge_trees(n4, n9)
