def two_sum(nums, target)
  dict = {}
  nums.each_with_index do |n, i|
    n2 = target - n
    return [dict[n2], i] if dict[n2]
    dict[n] = i
  end
end
