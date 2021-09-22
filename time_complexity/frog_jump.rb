# https://app.codility.com/programmers/lessons/3-time_complexity/frog_jmp/

# three integers X, Y and D
# returns the minimal number of jumps from position X to a position equal to or greater than Y.
# X, Y and D are integers within the range [1..1,000,000,000];
# X ≤ Y.
# Performant but wrong..
def solution(x, y, d)
  sol = (y - x) / d

  (y - x) % d == 0 ? sol : sol + 1
end

