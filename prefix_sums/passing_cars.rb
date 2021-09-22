# https://app.codility.com/programmers/lessons/5-prefix_sums/passing_cars/

# Brute force:
# def solution(arr)
#   # [0, 2]
#   has_z = []
#   # [1, 3, 4]
#   has_one = []
#   pass_cars = 0
#
#   arr.each_with_index do |el, idx|
#     el == 0 ? has_z << idx : has_one << idx
#   end
#
#   has_z.each do |zero|
#     has_one.each do |one|
#       pass_cars += 1 if zero < one
#     end
#   end
#
#   pass_cars
# end

def solution(arr)
  zeros = 0
  pass_cars = 0

  (0...arr.size).each do |idx|
    arr[idx] == 0 ? zeros += 1 : pass_cars += zeros

    return -1 if pass_cars > 1000000000
  end

  pass_cars
end

p solution([0, 1, 0, 1, 1]) == 5
