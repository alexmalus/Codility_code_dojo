# https://app.codility.com/programmers/lessons/5-prefix_sums/count_div/

# A = 6, B = 11 and K = 2, your function should return 3
# there are three numbers divisible by 2 within the range [6..11], namely 6, 8 and 10.
# A and B are integers within the range [0..2,000,000,000];
# K is an integer within the range [1..2,000,000,000];
# A ≤ B.
#
# Given any two natural numbers, the number of divisors is exactly the natural division between them:
# A / B
#
# In order to get the number of divisors between two numbers, you only need to
# calculate the numbers of divisors of the bigger number and then subtract the number of divisors of the smaller number,
# however, since the smaller number can be count, we calculate the number of divisor of the smaller number minus one:
# B // K - (A - 1) // K
# sec_num / div_by_num - (first_num - 1) / div_by_num
def solution(first_num, sec_num, div_by_num)
  sec_num / div_by_num - (first_num - 1) / div_by_num
end
