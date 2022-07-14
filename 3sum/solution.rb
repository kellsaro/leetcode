# @param {Integer[]} nums
# @return {Integer[][]}
require 'set'

def three_sum(nums)
  dict = Hash.new(0)
  nums.each do |e|
    dict[e] +=1 if dict[e] < 3  
  end
  
  new_nums = []  
  dict.each_pair do |k, v|
    v.times{ new_nums << k }  
  end    
    
  nums = new_nums.sort
  length = nums.length
  sol = Set.new()
  targets = Set.new()
    
  nums.each_with_index do |num, i|
    target = num
    unless targets.include?(target)  
      search_numbers(nums, i+1, length - 1, -target, sol) 
      targets.add(target) 
    end    
  end
    
  sol.to_a
end

def search_numbers(nums, i, j, target, sol)
  dict = {}
  i.upto(j).each do |k|
    if dict[target - nums[k]]  
      sol.add([-target, target - nums[k], nums[k]])
    else    
      dict[nums[k]] = true
    end    
  end
end
