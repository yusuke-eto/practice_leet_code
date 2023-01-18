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
def delete_duplicates(head)
    return if head.nil?
    return head if head.next.nil?

    next_node = head.next

    loop do
        if next_node.val > head.val
            head.next = next_node
            delete_duplicates(head.next)
            break
        else
            next_node = next_node.next
            if next_node.nil?
                head.next = nil
                break
            end
        end
    end

    head
end

# Answer2
# @param {ListNode} head
# @return {ListNode}
# def delete_duplicates(head)
#     return if head.nil?
#     return head if head.next.nil?

#     return if head.nil?
#     return head if head.next.nil?

#     copy = head
#     while !copy.next.nil?
#         if copy.val == copy.next.val
#             copy.next = copy.next.next
#         else
#             copy = copy.next
#         end
#     end
    
#     head
# end

l1 = ListNode.new(1)
l2 = ListNode.new(1)
l3 = ListNode.new(2)
l4 = ListNode.new(3)
l5 = ListNode.new(3)

l1.next = l2
l2.next = l3
l3.next = l4
l4.next = l5

a = delete_duplicates(l1)

while !a.nil?
    p a.val
    a = a.next
end