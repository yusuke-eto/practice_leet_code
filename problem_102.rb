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
# @return {Integer[][]}
def level_order(root)
    array = []
    return array if root.nil?

    nodes = [root]
    while nodes.count > 0 do
        array << nodes.map { |node| node.val }
        tmp = []
        nodes.each do |node|
            tmp << node.left unless node.left.nil?
            tmp << node.right unless node.right.nil?
        end
        nodes = tmp
    end
    array
end

root = [3,9,20,nil,nil,15,7]
t0 = TreeNode.new(10)
t1 = TreeNode.new(7, t0)
t2 = TreeNode.new(15)
t3 = TreeNode.new(20, t2, t1)
t4 = TreeNode.new(9)
t5 = TreeNode.new(3, t4, t3)
p level_order(t5)
