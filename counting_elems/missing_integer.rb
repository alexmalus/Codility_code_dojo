# https://app.codility.com/programmers/lessons/4-counting_elements/missing_integer/

# that, given an array A of N integers, returns the smallest positive integer (greater than 0) that does not occur in A.
# For example, given A = [1, 3, 6, 4, 1, 2], the function should return 5.
# Given A = [1, 2, 3], the function should return 4.
# Given A = [−1, −3], the function should return 1.
# N is an integer within the range [1..100,000];
# each element of array A is an integer within the range [−1,000,000..1,000,000].
def solution(arr)
  min = 1

  arr.sort.each do |el|
    min += 1 if min == el
  end

  min
end

p solution([-1000, 0])
p solution([1, 3, 6, 4, 1, 2])
