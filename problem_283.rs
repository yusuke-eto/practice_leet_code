impl Solution {
    pub fn move_zeroes(nums: &mut Vec<i32>) {
        let mut index = 0;
        let mut zero_count = 0;
        let len = nums.len();
​
        while index < len - zero_count {
            if nums[index] == 0 {
                zero_count += 1;
                nums.remove(index);
            } else {
                index += 1;
            }
        }
​
        for _ in 0..zero_count { nums.push(0) }
    }
}
