# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# @param {ListNode} l1
# @param {ListNode} l2
# @return {ListNode}
def add_two_numbers(l1, l2)
  add_two_numbers_aux(l1, l2, 0)  
end

def add_two_numbers_aux(node1, node2, carr)
  if node1.nil? && node2.nil?
    return carr == 0 ? nil : ListNode.new(carr)
  end    
    
  val = (node1&.val || 0) + (node2&.val || 0) + carr
  carr = 0
  
  if val >= 10
    carr = 1
    val = val - 10
  end    
    
  ListNode.new(val, add_two_numbers_aux(node1&.next, node2&.next, carr)) 
end
