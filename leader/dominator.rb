# https://app.codility.com/programmers/lessons/8-leader/dominator/

# -2147483648..2147483648
# ref: https://github.com/mrhead/codility/blob/master/dominator.rb
def solution(a)
  size = 0
  leader_candidate = nil
  arr_size = a.size

  a.each do |item|
    if size == 0
      leader_candidate = item
      size += 1
    else
      leader_candidate != item ? size -= 1 : size += 1
    end

    break if size > arr_size / 2
  end

  count = a.select { |v| v == leader_candidate }.size
  return -1 if count <= arr_size / 2

  a.index { |v| v == leader_candidate }
end

# p solution([3, 4, 3, 2, 3, -1, 3, 3])
p solution([2, 4, 1, 3, 3, 3, 3, 3])
