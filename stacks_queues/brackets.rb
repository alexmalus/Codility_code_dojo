# https://app.codility.com/programmers/lessons/7-stacks_and_queues/brackets/
# https://www.hackerrank.com/challenges/balanced-brackets/problem

# S has the form "(U)" or "[U]" or "{U}" where U is a properly nested string;
# S has the form "VW" where V and W are properly nested strings.
# "{[()()]}" is properly nested but "([)()]" is not.
#
# N is an integer within the range [0..200,000];
# string S consists only of the following characters: "(", "{", "[", "]", "}" and/or ")".
#
# Ref: https://github.com/cutajarj/CodilityInRuby/blob/master/libs/stacksandqueues/brackets.rb
def solution(s)
  start_brackets = %w|( [ {|
  valid = true
  stack = []

  s.each_char do |c|
    return 0 unless valid

    if start_brackets.include?(c)
      stack.push(c)
    elsif c == ')'
      top_bracket = stack.pop
      valid = false if top_bracket != '('
    elsif c == ']'
      top_bracket = stack.pop
      valid = false if top_bracket != '['
    else # c == '}'
      top_bracket = stack.pop
      valid = false if top_bracket != '{'
    end
  end

  valid && stack.empty? ? 1 : 0
end

p solution('{[()()]}') == 1
# p solution('([)()]').zero?
