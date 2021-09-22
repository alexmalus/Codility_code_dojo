# https://app.codility.com/programmers/lessons/3-time_complexity/tape_equilibrium/

# A non-empty array A consisting of N integers is given.
# Array A represents numbers on a tape.
# N is an integer within the range [2..100,000];
# each element of array A is an integer within the range [−1,000..1,000]
def solution(arr)
  abs_arr = arr.collect(&:abs)
  min = abs_arr.inject(:+)
  left_sum = 0
  right_sum = min

  abs_arr.each do |int|
    left_sum += int
    right_sum -= int

    diff = (left_sum - right_sum).abs
    min = diff if diff < min

    # there's nothing smaller than 0, as we are dealing with an absolute difference.
    break if min == 0
  end

  min
end

p solution([-1000, 1000])
p solution([-2, -3, -4, -1])