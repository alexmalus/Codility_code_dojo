# https://app.codility.com/programmers/lessons/2-arrays/odd_occurrences_in_array/

# A non-empty array A consisting of N integers is given
# The array contains an odd number of elements
# each element of the array can be paired with another element that has the same value
# except for one element that is left unpaired.
#
# Write an efficient algorithm for the following assumptions:
#         N is an odd integer within the range [1..1,000,000];
#         each element of array A is an integer within the range [1..1,000,000,000];
#         all but one of the values in A occur an even number of times.
# N max 999999
def solution(arr)
  temp_hash_odd_balls = {}

  arr.each { |el| temp_hash_odd_balls[el] ? temp_hash_odd_balls.delete(el) : temp_hash_odd_balls[el] = 0 }

  temp_hash_odd_balls.keys.first
end

# better solution, as inspired by: https://github.com/kumar91gopi/Algorithms-and-Data-Structures-in-Ruby/blob/master/codility/Arrays/OddOccurencesInArray.rb
# xor them.
# a^a = 0