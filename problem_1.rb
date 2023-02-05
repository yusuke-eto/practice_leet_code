# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
def two_sum(nums, target)
    hash = {}
    
    nums.each_with_index do |i, idx|
        hash[i].nil? ? hash[i] = [idx] : hash[i] << idx
    end

    hash.each do |key, val|
        sub = target - key
        if sub == key && hash[sub].length() >= 2
            return hash[sub]
        elsif hash[sub] && hash[sub].length() < 2
            return [val.first, hash[sub].first] 
        end
    end

    raise Exception.new("not found")
end

nums = [2,7,11,15]
target = 9

p two_sum(nums, target)

nums = [3,3]
target = 6

p two_sum(nums, target)