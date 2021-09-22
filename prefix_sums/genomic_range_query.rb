# https://app.codility.com/programmers/lessons/5-prefix_sums/genomic_range_query/

# Nucleotides of types A, C, G and T have impact factors of 1, 2, 3 and 4, respectively
# minimal impact factor of nucleotides contained in a particular part of the given DNA sequence?
#
# S = S[0]S[1]...S[N-1] consisting of N characters
# There are M queries, which are given in non-empty arrays P and Q, each consisting of M integers
# The K-th query (0 ≤ K < M) requires you to find the minimal impact factor of nucleotides contained in the DNA sequence
# between positions P[K] and Q[K] (inclusive).
#
# N is an integer within the range [1..100,000];
# M is an integer within the range [1..50,000];
# each element of arrays P, Q is an integer within the range [0..N − 1];
# P[K] ≤ Q[K], where 0 ≤ K < M;
# string S consists only of upper-case English letters A, C, G, T.
#
# Ref: https://stackoverflow.com/questions/19552754/java-codility-training-genomic-range-query/21512180
# Ref: https://stackoverflow.com/a/28225477/2490996
def solution(s, p, q)
  n = s.size
  m = p.size

  impact = { 'A' => 1, 'C' => 2, 'G' => 3, 'T' => 4 }
  curr_counter = { 'A' => 0, 'C' => 0, 'G' => 0, 'T' => 0 }
  # how many times nucleotide repeats at the moment we reach s[i]
  counters = []
  min_impact = []

  # initialize counters first..then increment, then add counters..
  # why like this? do preserve the prefix_sums capability.. what has changed between X and X + 1?
  (0..n).each do |i|
    counters << { 'A' => curr_counter['A'], 'C' => curr_counter['C'], 'G' => curr_counter['G'], 'T' => curr_counter['T'] }
    curr_counter[s[i]] += 1 if s[i]
  end

  (0...m).each do |i|
    from = p[i]
    to = q[i] + 1

    # if at least one nucleotide changed between to and from..
    # meaning the element appeared while going through the DNA string, then mark it as min impact.
    if counters[to]['A'] - counters[from]['A'] > 0
      min_impact << impact['A']
    elsif counters[to]['C'] - counters[from]['C'] > 0
      min_impact << impact['C']
    elsif counters[to]['G'] - counters[from]['G'] > 0
      min_impact << impact['G']
    else
      min_impact << impact['T']
    end
  end

  min_impact
end

p solution('CAGCCTA', [2, 5, 0], [4, 5, 6])
p solution('A', [0], [0])
