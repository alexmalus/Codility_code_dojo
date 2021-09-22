# https://app.codility.com/programmers/lessons/5-prefix_sums/min_avg_two_slice/

# A non-empty array A consisting of N integers is given.
# pair of integers (P, Q), such that 0 ≤ P < Q < N -> slice of array A
# slice contains at least two elements
# average of a slice (P, Q) is the sum of A[P] + A[P + 1] + ... + A[Q] divided by the length of the slice
# average equals (A[P] + A[P + 1] + ... + A[Q]) / (Q − P + 1)
#
# Ref: https://codesays.com/2014/solution-to-min-avg-two-slice-by-codility/
def solution(a)
  min_indeces = [0, 1]
  current_indeces = [0, 1]

  (2...a.size).each do |i|
    current_indeces << i
    min_indeces = current_indeces.dup if average(a, current_indeces) < average(a, min_indeces)

    current_indeces.shift
    min_indeces = current_indeces.dup if average(a, current_indeces) < average(a, min_indeces)
  end

  min_indeces.first
end

def average(array, indeces)
  total = 0.0
  indeces.each { |i| total += array[i] }

  total / indeces.length
end

p solution([4, 2, 2, 5, 1, 5, 8])
