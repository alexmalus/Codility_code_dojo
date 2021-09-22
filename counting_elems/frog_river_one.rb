# https://app.codility.com/programmers/lessons/4-counting_elements/frog_river_one/

def solution(x, arr)
  leaves = {}

  arr.each_with_index do |el, idx|
    leaves[el] = true
    return idx if leaves.size == x
  end

  -1
end
