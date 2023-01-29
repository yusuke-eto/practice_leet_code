# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer}
def search_insert(nums, target)
    binary_search(nums, target)
end

def binary_search(array, val)
    return 0 if array.length == 0

    head, tail = 0, array.length - 1

    while head < tail do
        n = (head + tail) / 2

        if val == array[n]
          return n
        elsif val < array[n]
          tail = n
        else
          head = n + 1
        end
    end
  
    if val <= array[head]
        head
    else
        head += 1
    end
end

nums = [1,3,5,6]
target = 2

# expect 1
p search_insert(nums, target)

nums = [1,3,5,6]
target = 7

# expect 4
p search_insert(nums, target)

nums = [3,4,5,6,9]
target = 2

# expect 0
p search_insert(nums, target)