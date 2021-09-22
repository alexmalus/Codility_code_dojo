# https://app.codility.com/programmers/lessons/4-counting_elements/max_counters/

# array A of M integers
# output: array of integers with value of counters.
# N and M are integers within the range [1..100,000];
# each element of array A is an integer within the range [1..N + 1].
def solution(number, arr)
  max = 0
  counters = Array.new(number, max)

  arr.each do |el|
    if el <= number
      counters[el - 1] += 1
      max = counters[el - 1] if max < counters[el - 1]
    else
      counters = Array.new(number, max)
    end
  end

  counters
end

# p solution(5, [3, 4, 4, 6, 1, 4, 4])
p solution(1, [1, 2, 1, 2, 1, 2])
