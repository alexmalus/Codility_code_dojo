# A positive integer D is a factor of a positive integer N if there exists an integer M such that N = D * M.
# 6 is a factor of 24, because M = 4 satisfies the above condition (24 = 6 * 4)
# N can be: 2147483647
# Ref: https://github.com/kumar91gopi/Algorithms-and-Data-Structures-in-Ruby/blob/master/codility/Prime%20and%20composite%20numbers/CountFactors.rb
def solution(n)
  num = 0
  len = Math.sqrt(n).floor

  (1..len).each do |i|
    next unless n % i == 0

    num += n / i != i ? 2 : 1
  end

  num
end
