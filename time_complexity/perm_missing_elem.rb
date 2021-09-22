# https://app.codility.com/programmers/lessons/3-time_complexity/perm_missing_elem/

#  array A consisting of N different integers is given
# array contains integers in the range [1..(N + 1)], which means that exactly one element is missing.
# Ex: arr: [2,3,1,5], missing: 4
# N is an integer within the range [0..100,000];
# the elements of A are all distinct;
# each element of array A is an integer within the range [1..(N + 1)].
def solution(arr)
  return 1 if arr.empty?

  # Ref: https://stackoverflow.com/questions/41449617/why-is-sum-so-much-faster-than-inject/41449844#41449844
  # we arr +1, also the missing element in consideration.
  complete_sum_incl_missing = (arr.size + 1) * (arr.size + 2) / 2

  complete_sum_incl_missing - arr.inject(:+)
end
