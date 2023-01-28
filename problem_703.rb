class KthLargest

    # =begin
    #     :type k: Integer
    #     :type nums: Integer[]
    # =end
    def initialize(k, nums)
        @k = k
        @nums = quick_sort(nums)
    end
    
    
    # =begin
    #     :type val: Integer
    #     :rtype: Integer
    # =end
    def add(val)
        insert(val)
        @nums[-@k]
    end

    private

    def insert(val)
        min = 0
        max = @nums.length - 1
        return @nums = [val] if @nums.length == 0
        return @nums = [val, *@nums[0..]] if val <= @nums[0]
        return @nums = [*@nums[0..], val] if val >= @nums[-1]

        while min != max do
            n = (min + max) / 2

            if val <= @nums[n]
                max = n
            else
                min = n+1
            end
        end

        @nums = [*@nums[0...min], val, *@nums[min..]]
    end

    def quick_sort(nums)
        return nums if nums.length < 2

        pivot = nums[0]
        less = []
        greater = []
        nums[1..].each do |i|
            if i <= pivot
                less << i
            else
                greater << i
            end
        end
        [*quick_sort(less), pivot, *quick_sort(greater)]
    end
end
    
# Your KthLargest object will be instantiated and called as such:
# obj = KthLargest.new(k, nums)
# param_1 = obj.add(val)

kthLargest = KthLargest.new(3, [4, 5, 8, 2]);
p kthLargest.add(3);   # return 4
p kthLargest.add(5);   # return 5
p kthLargest.add(10);  # return 5
p kthLargest.add(9);   # return 8
p kthLargest.add(4);   # return 8