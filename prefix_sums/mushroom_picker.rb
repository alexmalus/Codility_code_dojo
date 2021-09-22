# https://codility.com/media/train/3-PrefixSums.pdf
# https://stackoverflow.com/questions/40336367/python-prefix-sum-algorithm
# https://en.wikipedia.org/wiki/Prefix_sum
# http://thisthread.blogspot.com/2014/11/codility-mushroom-picker.html

# at P[x], we have the sum A[0] + A[1] + ... + A[x].
def prefix_sums(arr)
  arr_size = arr.size
  p_arr = Array.new(arr_size, 0)
  p_arr[0] = arr[0]

  (1...arr.size).each do |k|
    p_arr[k] = p_arr[k - 1] + arr[k]
  end

  p_arr
end

def count_total(p_arr, left_pos, right_pos)
  left_pos > 0 ? p_arr[right_pos] - p_arr[left_pos - 1] : p_arr[right_pos]
end

p_arr = prefix_sums([2, 3, 7, 5, 1, 3, 9])
p p_arr
p count_total(p_arr, 3, 4)
