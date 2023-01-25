# Definition for singly-linked list.
class ListNode
    attr_accessor :val, :next
    def initialize(val = 0, _next = nil)
        @val = val
        @next = _next
    end
end
# @param {ListNode} head
# @return {ListNode}
def reverse_list(head)
    array = []
    while !head.nil? do
        array << head
        head = head.next
    end

    node = ListNode.new 
    copy = node

    while k = array.pop do
        if array.empty?
            k.next = nil
        end
        copy.next = k
        copy = k
    end

    node.next
end

l1 = ListNode.new(1)
l2 = ListNode.new(2)
l3 = ListNode.new(3)
l4 = ListNode.new(4)
l5 = ListNode.new(5)

l1.next = l2
l2.next = l3
l3.next = l4
l4.next = l5

list = reverse_list(l1)

loop do
    break if list.nil?
    p list.val
    list = list.next
end
