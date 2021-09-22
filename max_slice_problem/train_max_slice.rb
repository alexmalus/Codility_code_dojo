# https://codility.com/media/train/7-MaxSlice.pdf

def golden_max_slice(arr)
  max_ending = 0
  max_slice = 0

  arr.each do |el|
    max_ending = [0, max_ending + el].max
    max_slice = [max_slice, max_ending].max
  end

  max_slice
end

p golden_max_slice([5, -7, 3, 5, -2, 4, -1])
