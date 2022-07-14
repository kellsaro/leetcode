# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
def two_sum(nums, target)
  nums_with_index = [];
  # O[n]  
  nums.each_with_index do |el, i|
    nums_with_index << [el, i]  
  end
  
  # O[n log(n)]
  nums_with_index.sort_by!{|e| e[0]}
  length = nums_with_index.length  

  # O[n log(n)]: iteration O[n] * binary search on sorted array O[log(n)]
  nums_with_index.each_with_index do |e, i|
    num1 = e[0]
    index1 = e[1]

    num2 = target - num1

    j_init = i + 1
    j_end = length - 1
    j = (j_init + j_end) / 2
      
    # O[log(n)]
    while (j_init <= j && j <=j_end) do
      if j_init == j_end
        return [index1, nums_with_index[j_init][1]] if (nums_with_index[j_init][0] == num2)
        break;
      else
        if j_init + 1 == j_end
          return [index1, nums_with_index[j_init][1]] if (nums_with_index[j_init][0] == num2)
          return [index1, nums_with_index[j_end][1]] if (nums_with_index[j_end][0] == num2)                    
          break;
        else
          candidate = nums_with_index[j][0]
          return [index1, nums_with_index[j][1]] if (candidate == num2)

          j_init, j_end = (candidate < num2) ? [j, j_end] : [j_init, j]
          j = (j_init + j_end) / 2
        end
      end
    end
  end
end
