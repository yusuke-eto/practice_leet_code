# @param {Integer[]} nums
# @return {Integer}
def rob(nums)
    return if nums.empty?
    return nums[0] if nums.length == 1
    
    s1 = 1
    s2 = 0

    max = nums[0]
    memo = {}
    memo["0_-1"] = nums[0]
    while !nums[s1].nil? do
        previous_max = memo["#{s1 - 2}_#{s2 - 2}"] || 0
        tmp = previous_max + nums[s1]
        max = tmp if tmp > max
        memo["#{s1}_#{s2}"] = max

        s1 += 1
        s2 += 1
    end
    max
end

nums = [1,2,3,1]
p rob(nums)

nums = [2,7,9,3,1]
p rob(nums)