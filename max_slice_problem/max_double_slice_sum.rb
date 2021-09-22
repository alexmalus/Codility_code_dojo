# https://app.codility.com/programmers/lessons/9-maximum_slice_problem/max_double_slice_sum/

# A triplet (X, Y, Z), such that 0 ≤ X < Y < Z < N, is called a double slice.
# Ref: https://rafal.io/posts/codility-max-double-slice-sum.html
# https://en.wikipedia.org/wiki/Maximum_subarray_problem#Kadane's_algorithm
# https://stackoverflow.com/questions/25726735/maxdoubleslicesum-codility-algorithm
def solution(a)
  a[0] = 0
  a[-1] = 0

  max_from_left = []
  max_ending = 0
  a.each do |v|
    max_ending = [0, max_ending + v].max
    max_from_left << max_ending
  end

  max_from_right = []
  max_ending = 0
  a.reverse.each do |v|
    max_ending = [0, max_ending + v].max
    max_from_right << max_ending
  end
  max_from_right.reverse!

  n = a.size
  max_double_slice = 0
  for i in 1..n-2
    max_double_slice = [max_double_slice, max_from_left[i - 1] + max_from_right[i + 1]].max
  end

  max_double_slice
end

p solution([3, 2, 6, -1, 4, 5, -1, 2])
