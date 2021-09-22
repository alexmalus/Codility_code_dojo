# https://app.codility.com/c/run/trainingHAHE88-2HR/
# [0,0,0] X times
# [1,2,3,4] 4 times -> [1,2,3,4]
# N and K are integers within the range [0..100];
# each element of array A is an integer within the range [−1,000..1,000].
def solution(arr, no_shifts)
  return arr if arr.empty? || no_shifts.zero?

  arr_size = arr.size
  return arr if arr.uniq.size == 1

  (no_shifts % arr_size).times { arr.unshift(arr.pop) }

  arr
end

p solution([3, 8, 9, 7, 6], 3)
