# https://app.codility.com/programmers/lessons/7-stacks_and_queues/fish/

# two non-empty arrays A and B consisting of N integers
# fish are numbered from 0 to N − 1
# Fish number P is represented by A[P] and B[P]. Array A contains the sizes of the fish. All its elements are unique.
# Array B contains the directions of the fish. It contains only 0s and/or 1s, where:
# 0 represents a fish flowing upstream,
# 1 represents a fish flowing downstream.
#         N is an integer within the range [1..100,000];
#         each element of array A is an integer within the range [0..1,000,000,000];
#         each element of array B is an integer that can have one of the following values: 0, 1;
#         the elements of A are all distinct.
# Stack level too deep on one test case..
# def solution(a, b)
#   alive_fish = [[a.shift, b.shift]]
#
#   b.each_with_index do |dir, idx|
#     size = a[idx]
#     fish = [size, dir]
#
#     alive_fish = showdown(alive_fish, fish)
#   end
#
#   alive_fish.size
# end
#
# def showdown(alive_fish, fish)
#   return alive_fish << fish if skip_eating?(alive_fish[-1], fish)
#   return alive_fish if alive_fish[-1][0] > fish[0]
#
#   # last fish eliminated.
#   alive_fish.pop
#
#   return [fish] if alive_fish.empty?
#
#   showdown(alive_fish, fish)
# end
#
# def skip_eating?(prev_fish, curr_fish)
#   prev_fish[1] == curr_fish[1] || (prev_fish[1] == 0 && curr_fish[1] == 1)
# end

# ref: https://github.com/alessandrogurgel/codility/blob/master/fish.rb
def solution(a, b)
  alive_fish = b.size
  stack = []

  b.each_with_index do |dir, i|
    if dir == 1
      stack << a[i]
      next
    else
      while stack.any? && a[i] > stack.last
        stack.pop
        alive_fish -= 1
      end

      alive_fish -= 1 if stack.any? && a[i] < stack.last
    end
  end

  alive_fish
end

p solution([4, 3, 2, 1, 5], [0, 1, 0, 0, 0]) == 2
p solution([3, 5, 6, 7, 4, 8], [0, 1, 1, 1, 1, 0]) == 2

