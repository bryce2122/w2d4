require "byebug"

def anagram?(word_1,word_2)
  (word_1.chars.permutation().to_a).include?(word_2.chars)
end

def second_anagram?(word1, word2)
  return false if word1.length != word2.length
  word1.dup.each_char.with_index do |elt, idx|
    if word2.chars.include?(elt)

      idx = word1.index(elt)

        word1 = word1[0...idx] + word1[idx+1..-1]

      end
      # index = word2.index(elt)
      # word2 = word2[0...index] + word2[index + 1..-1]

  end

  word1.empty? ? true : false
end

def third_anagram(word1,word2)

  return true if word1.chars.sort == word2.chars.sort
  return false

end


def fourth_anagram(word1,word2)

  hash_1 = Hash.new(0)
  hash_2 = Hash.new(0)

  word1.each_char do |ch|
    hash_1[ch] += 1
  end

  word2.each_char do |ch|
    hash_2[ch] += 1
  end
return hash_1 == hash_2
  # hash_1.each do |k,v|
  #   return false if hash_2[k] != v
  # end
  # true
end


def window_max(array,w)

  current_max_range = 0
  array.each_cons(w) do |element|
    max,min = element.max,element.min
    current_max_range = max - min if max - min > current_max_range
  end
  current_max_range

  end


  def optimized_solution(array,w)
   start = 0
   result = [array.shift]
   current_max = -10
   array.each do |el|
    if el < result.first
       result.unshift(el)
    elsif el > result.last
      result << el
    else
      array.insert(1,el)
    end

    start += 1

    if start == w
      if result.last - result.first > current_max
        current_max = result.last - result.first
      end
      result.shift
      start -= 1
    end
  end
  current_max
end








# def permutations(array)
#   return [array] if array.length < 2
#
#   total_array = []
#
#   perms = (permutations(array.take(array.length - 1)))
#
#   last = array.last
#
#   (0..perms.length).each do |index|
#     perms.each do |array|
#       total_array << array[0...index] + [last] + array[index..-1]
#     end
#   end
#
#   total_array
#end


#p anagram?("elvis","lives")
p second_anagram?("elvis","lives")
