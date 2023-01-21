# Definition for singly-linked list.
class ListNode
    attr_accessor :val, :next
    def initialize(val)
        @val = val
        @next = nil
    end
end

# @param {ListNode} head
# @return {ListNode}
def detectCycle(head)
  fast = head
  slow = head

  return -1 if head.nil? || head.next.nil?

  loop do
    fast = fast.next&.next
    slow = slow.next

    return if fast.nil?

    if fast == slow
      break
    end
  end

  index = 0
  slow = head

  loop do
    if fast == slow
      break
    end
    
    index += 1
    fast = fast.next
    slow = slow.next
  end

  index
end

l1 = ListNode.new(1)
l2 = ListNode.new(2)
l3 = ListNode.new(0)
l4 = ListNode.new(-4)

l1.next = l2
l2.next = l3
l3.next = l4
l4.next = l2

p detectCycle(l1)
