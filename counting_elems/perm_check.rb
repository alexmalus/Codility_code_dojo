# https://app.codility.com/programmers/lessons/4-counting_elements/perm_check/

# A permutation is a sequence containing each element from 1 to N once, and only once.
# returns 1 if array A is a permutation and 0 if it is not.
def solution(arr)
  arr_size = arr.size

  arr.any? { |el| el > arr_size } || arr.uniq.size < arr_size ? 0 : 1
end

p solution([4, 1, 2, 3]) == 1
