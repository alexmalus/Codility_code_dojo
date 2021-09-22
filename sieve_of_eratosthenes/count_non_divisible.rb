# https://app.codility.com/programmers/lessons/11-sieve_of_eratosthenes/count_non_divisible/

def solution(a)
  elements = a.inject(Hash.new(0)) {|acc, el| acc[el] +=1;acc }
  n = elements.keys.sort

  div = n.each.inject(Hash.new(0)) do |acc, el|
    k=el
    while k < n[-1]
      k+=el
      acc[k] += elements[el]
    end
    acc
  end

  a.map {|x|  a.size - elements[x] - div[x] }
end

p solution([3, 1, 2, 3, 6])
