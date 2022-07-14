# @param {String} s
# @return {Integer}
def length_of_longest_substring(s)
  chars = []
  s.each_char {|ch| chars << ch }  
  poss_max = chars.uniq&.length || 0
  return poss_max if poss_max <= 2
    
  max = 1
  last_index = chars.length - 1

  chars.each_with_index do |ch, i|
    set = [ch]
    j = i + 1
    check_with_next_index = j <= last_index

    while check_with_next_index do
      if set.include?(chars[j])
        max = set.length if max < set.length
        return max if max == poss_max
        check_with_next_index = false
      else
        set << chars[j]
        j += 1
        check_with_next_index = j <= last_index  
      end
    end
    
    max = set.length if max < set.length
    return max if max == poss_max
  end
    
  max
end
