# @param {Integer[]} nums1
# @param {Integer[]} nums2
# @param {Integer} k
# @return {Integer[][]}
def k_smallest_pairs(nums1, nums2, k)
    priority_queue = [] # 優先度キュー
    result = [] # 答えとなるペアのindexを格納する

    i = 0
    while priority_queue.length < k && nums1[i]
        priority_queue << [i, 0]
        i += 1
    end

    while result.length < k && priority_queue.length != 0 do
        most_min_pair = priority_queue.shift
        result << [nums1[most_min_pair[0]], nums2[most_min_pair[1]]]

        priority_queue = insert_priority_queue(priority_queue, [most_min_pair[0], most_min_pair[1] + 1], nums1, nums2)
    end
    result
end

def insert_priority_queue(priority_queue, pair, nums1, nums2)
    return priority_queue if nums1[pair[0]].nil? || nums2[pair[1]].nil?

    binary_search_and_insert(priority_queue, pair, nums1, nums2)
end

# @params [Array] array バイナリサーチの対象となる昇順ソート済み配列
# @params [Integer] target 探したい値
# @return [Array] arrayにvalを追加した結果の配列
def binary_search_and_insert(array, pair, nums1, nums2)
    return [pair] if array.length == 0
    val = nums1[pair[0]] + nums2[pair[1]]
    return [pair, *array[0..]] if val <= nums1[array[0][0]] + nums2[array[0][1]]
    return [*array[0..], pair] if val >= nums1[array[-1][0]] + nums2[array[-1][1]]

    head, tail = 0, array.length - 1

    while head != tail do
        n = (head + tail) / 2

        if val <= nums1[array[n][0]] + nums2[array[n][1]]
          tail = n
        else
          head = n + 1
        end
    end
  
    [*array[0...head], pair, *array[head..]]
end

nums1 = [1,7,11]
nums2 = [2,4,6]
k = 9
p k_smallest_pairs(nums1, nums2, k)

nums1 = [1,1,2]
nums2 = [1,2,3]
k = 9
p k_smallest_pairs(nums1, nums2, k)

nums1 = [1,2]
nums2 = [3]
k = 3
p k_smallest_pairs(nums1, nums2, k)

nums1 = [1,1,2]
nums2 = [1,2,3]
k = 10
p k_smallest_pairs(nums1, nums2, k)