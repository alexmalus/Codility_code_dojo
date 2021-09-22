def solution(n)
  return 0 if n < 5

  binary_chars = n.to_s(2).chars
  max_size = 0
  queue = GapCounter.new

  binary_chars.each do |char|
    next if !queue.start && !queue.edge_queue?(char)

    if !queue.start && one?(char)
      queue.start_count
    elsif queue.start && one?(char)
      max_size = queue.content if max_size < queue.content
      queue.init_state(start_enabled: true)
    else
      queue.increment_count
    end
  end

  max_size
end

def one?(char)
  char == '1'
end

# Used to keep track of gap.
class GapCounter
  attr_accessor :start, :content, :end_queue

  def initialize
    init_state
  end

  def edge_queue?(char)
    char == '1'
  end

  def start_count
    @start = true
  end

  def increment_count
    @content += 1
  end

  def init_state(start_enabled: false)
    @start = start_enabled
    @content = 0
    @end_queue = false
  end
end

# This one did not pass initially, because there can be multiple gap queues.
# Once you finish one (through a 1), the other one has to be init with start already enabled..
#p solution(328)

# p solution(2147483647)

# Got 1 expected 2
p solution(51712)
