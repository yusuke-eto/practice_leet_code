# Definition for singly-linked list.
class ListNode
    attr_accessor :val, :next
    def initialize(val)
        @val = val
        @next = nil
    end
end

# solution1
def hasCycle(head)
    array = []
    result = false
    current = head
    loop do
      break if current&.next.nil?

      array << current
      if array.include?(current.next)
        result = true
        break
      end
      current = current.next
    end
    result
end

# solution2
def hasCycle(head)
    result = false
    usagi = head
    kame = head

    loop do
      usagi = usagi&.next&.next
      kame = kame&.next
      break if usagi.nil? || kame.nil?
      
      if usagi == kame
        result = true
        break
      end
    end
    result
end

l4 = ListNode.new(-4)
l3 = ListNode.new(0)
l2 = ListNode.new(2)
l1 = ListNode.new(3)

l1.next = l2
l2.next = l3
l3.next = l4
l4.next = l2

a = hasCycle(l1)
p a
