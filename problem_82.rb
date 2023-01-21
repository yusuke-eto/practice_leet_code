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
    return nil if head.nil?
    return head if head.next.nil?

    dummy_head = ListNode.new(nil)
    dummy_head.next = head
    copy = dummy_head

    while !copy&.next.nil? && !copy&.next.next.nil? do
        if copy.next.val == copy.next.next.val
            temp = copy.next
            while !temp.next.nil? do
                if temp.val == temp.next.val
                    temp = temp.next
                else
                    break
                end
            end
            copy.next = temp.next
        else
            copy = copy.next
        end
    end
    
    dummy_head.next
end

l1 = ListNode.new(1)
l2 = ListNode.new(1)
l3 = ListNode.new(3)
l4 = ListNode.new(4)
l5 = ListNode.new(4)
l6 = ListNode.new(5)

l1.next = l2
l2.next = l3
l3.next = l4
l4.next = l5
l5.next = l6

result = delete_duplicates(l1)

loop do
    puts result&.val
    break if result&.next.nil?

    result = result.next
end