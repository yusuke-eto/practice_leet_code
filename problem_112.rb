# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val = 0, left = nil, right = nil)
#         @val = val
#         @left = left
#         @right = right
#     end
# end
# @param {TreeNode} root
# @param {Integer} target_sum
# @return {Boolean}
def has_path_sum(root, target_sum)
    return false if root.nil?

    sum = target_sum - root.val

    return true if (root.right.nil? && root.left.nil?) && sum == 0

    has_path_sum(root.right, sum) || has_path_sum(root.left, sum)
end
