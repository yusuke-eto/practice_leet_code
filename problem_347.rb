# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer[]}
def top_k_frequent(nums, k)
   hash = {}
   nums.each do |n| 
        hash[n] ||= 0
        hash[n] += 1
   end

   quick_sort(hash.to_a)[-k..].map { _1[0] }
end

def quick_sort(array)
    return array if array.length < 2

    pivot = array[0]
    less, greater = [], []
    array[1..].each { |i| i[1] <= pivot[1] ? less << i : greater << i }
    [*quick_sort(less), pivot, *quick_sort(greater)]
end

nums = [1,1,1,2,2,3]
k = 2
p top_k_frequent(nums, k)

nums = [1]
k = 1
p top_k_frequent(nums, k)