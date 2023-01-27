# @param {Integer[]} nums
# @return {Void} Do not return anything, modify nums in-place instead.
def move_zeroes(nums)
    index = 0
    zero_count = 0
    while !nums[index].nil? do
        if nums[index] == 0
            zero_count += 1
            nums.delete_at(index)
        else
            index += 1
        end
    end

    zero_count.times do
        nums << 0
    end
    nums
end

nums = [0,1,0,3,12]
p move_zeroes(nums)
