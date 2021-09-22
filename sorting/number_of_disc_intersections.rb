# https://app.codility.com/programmers/lessons/6-sorting/number_of_disc_intersections/

# draw N discs on a plane.
# discs are numbered from 0 to N − 1
# array A of N non-negative integers, each integer specifying radius of the disk.
# The J-th disc is drawn with its center at (J, 0) and radius A[J].
#
# N is an integer within the range [0..100,000];
# each element of array A is an integer within the range [0..2,147,483,647].
#
# The function should return −1 if the number of intersecting pairs exceeds 10,000,000.
#
# Ref: https://stackoverflow.com/questions/4801242/algorithm-to-calculate-number-of-intersecting-discs
# http://davidoncode.blogspot.com/2013/03/intersecting-discs-problem-in-ruby.html
def solution(arr)
  event = Hash.new { |h, k| h[k] = { start: 0, stop: 0 } }

  arr.each_index do |i|
    # Formula to calculate one circle: i - A[i], i + A[i]
    # idx 0, val is 1, will be (-1, 1), and event will have -1 => {start: 1, stop: 0} and 1 => {start: 0, stop: 1}
    event[i - arr[i]][:start] += 1
    event[i + arr[i]][:stop] += 1
  end
  # you sort by index, meaning the min of the radius of circles, then remain only with the start/stops.
  # showing where each disk starts and stops.
  sorted_events = (event.sort_by { |index, _value| index }).map! { |n| n[1] }

  past_start = 0
  intersect = 0

  # [{:start=>1, :stop=>0}, {:start=>1, :stop=>0}, {:start=>2, :stop=>0}, {:start=>0, :stop=>1},
  # {:start=>1, :stop=>0}, {:start=>0, :stop=>2}, {:start=>1, :stop=>1}, {:start=>0, :stop=>1}, {:start=>0, :stop=>1}]
  sorted_events.each do |e|
    # If there are 3 discs that we're in the middle of and a new disc starts, it intersects with all 3 of them.
    # If there are 3 discs that we're in the middle of, and 2 new discs start, each of them will intersect with the 3 existing ones, making 6 intersections.
    intersect += e[:start] * (e[:start] - 1) / 2 +
                 e[:start] * past_start

    # keep track of how many discs are currently open at each index.
    past_start += e[:start]
    past_start -= e[:stop]
  end
  intersect
end

p solution([1, 5, 2, 1, 4, 0])
