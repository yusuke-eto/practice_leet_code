# Definition for a binary tree node.
class TreeNode
    attr_accessor :val, :left, :right
    def initialize(val = 0, left = nil, right = nil)
        @val = val
        @left = left
        @right = right
    end
end
# @param {Integer[]} nums
# @return {TreeNode}
def sorted_array_to_bst(nums)
    middle = nums.length / 2
    node = TreeNode.new(nums[middle])
    node.left = sorted_array_to_bst(nums[0...middle]) if nums[0...middle].length >= 1
    node.right = sorted_array_to_bst(nums[middle+1..]) if nums[middle+1..].length >= 1
    node
end

def convert_node_to_array(node)
    return [nil] if node.nil?
    array = []
    
    [*convert_node_to_array(node.left), node.val, *convert_node_to_array(node.right)]
end

nums = [-10,-3,0,5,9]
result = sorted_array_to_bst(nums)
p convert_node_to_array(result)
