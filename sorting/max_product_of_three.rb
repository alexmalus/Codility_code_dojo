# https://app.codility.com/programmers/lessons/6-sorting/max_product_of_three/

# A non-empty array A consisting of N integers is given
# The product of triplet (P, Q, R) equates to A[P] * A[Q] * A[R] (0 ≤ P < Q < R < N).
def solution(arr)
  max = arr.sort

  max_1 = (max.first(2) + [max.last]).inject(:*)
  max_2 = max.last(3).inject(:*)

  max_1 > max_2 ? max_1 : max_2
end

p solution([-5, 5, -5, 4])
