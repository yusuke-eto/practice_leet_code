# @params [Array] array
# @return [Array] 昇順でソート後の配列
def quick_sort(array)
    return array if array.length < 2

    pivot = array[0]
    less, greater = [], []
    array[1..].each { |i| i <= pivot ? less << i : greater << i }
    [*quick_sort(less), pivot, *quick_sort(greater)]
end

a = [33, 15, 63, 1, 10, 22, 95, 32, 10]
p quick_sort(a)

# @params [Array] array バイナリサーチの対象となる昇順ソート済み配列
# @params [Integer] target 探したい値
# @return [Array] arrayにvalを追加した結果の配列
def binary_search_and_insert(array, val)
    return [val] if array.length == 0
    return [val, *array[0..]] if val <= array[0]
    return [*array[0..], val] if val >= array[-1]

    head, tail = 0, array.length - 1

    while head != tail do
        n = (head + tail) / 2

        if val <= array[n]
          tail = n
        else
          head = n + 1
        end
    end
  
    [*array[0...head], val, *array[head..]]
end

  a = [1,3,7, 9, 15, 21]
  p binary_search_and_insert(a, 5)
  p binary_search_and_insert(a, 33)
  p binary_search_and_insert(a, 13)

  # @params [Array] array バイナリサーチの対象となる昇順ソート済み配列
  # @params [Integer] target 探したい値 
  # @return [Integer, nil]
  def binary_search(array, val)
    return nil if array.length == 0

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
  
    # 一致しなかった場合はnilを明示的に返す
    nil
  end