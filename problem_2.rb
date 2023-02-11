# Definition for singly-linked list.
class ListNode
    attr_accessor :val, :next
    def initialize(val = 0, _next = nil)
        @val = val
        @next = _next
    end
end
# @param {ListNode} l1
# @param {ListNode} l2
# @return {ListNode}
def add_two_numbers(l1, l2)
    l1_sum = calculate_from_node(l1, 1)
    l2_sum = calculate_from_node(l2, 1)
    sum = l1_sum + l2_sum
    build_node(sum)
end

def calculate_from_node(node, digit)
    if node.next.nil?
        digit * node.val
    else
        digit * node.val + calculate_from_node(node.next, digit * 10)
    end
end

def build_node(sum)
    node = nil
    next_node = nil
    sum.to_s.each_char do |s|
        node = ListNode.new(s.to_i, next_node)
        next_node = node
    end
    node
end

l3 = ListNode.new(3)
l2 = ListNode.new(4, l3)
l1 = ListNode.new(2, l2)

l6 = ListNode.new(4)
l5 = ListNode.new(6, l6)
l4 = ListNode.new(5, l5)

p add_two_numbers(l1, l4)