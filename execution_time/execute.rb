
#time complexity quadratic
require 'byebug'
def my_min(list)
  min = list[0]
  list.each_with_index do |el,idx|
    boolean = (list[0...idx] + list[idx + 1..-1]).all? {|el2| el < el2}
    min = el if boolean
  end
  min
end


#time complexity - min, linear

def my_min_w(list)
  min = list.shift
  list.each do |el|
    min = el if el < min
  end
  min
end
#
# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# puts my_min(list)
# puts "phase II  #{my_min_w(list)}"

#quadratic time
def largest_subsum(list)
  sub_arrays = []
  (1..list.length).each do |num|
    list.each_cons(num) do |elt|
      sub_arrays << elt
    end
  end
  sub_arrays.sort_by{|elt| elt.reduce(:+)}[-1]
end

# list = [2, 3, -6, 7, -6, 7]
# p largest_subsum(list)

def largest_subsum_a(list)
  current_sum = [list.shift]
  current_max = list[0]
  final_max = current_sum
  list.each_with_index do |el,idx|
    if current_sum.reduce(:+) + el > current_sum.reduce(:+)
      current_sum << el
      p "#{current_sum}current_sum"
      p "#{current_sum.reduce(:+)} current sum reduce"
        p "#{final_max}final_max"
      p "#{final_max.reduce(:+)} final maxreduce"



    else
      if current_sum.reduce(:+) >= final_max.reduce(:+)
        final_max = current_sum
        current_sum = [el]
      else
        current_sum = [list[idx - 1],el]
      end
    end
  end
final_max
end
#list = [2, 3, -6, 7, -6, 7]
#p largest_subsum_a(list)

def largest_subsum_n(list)
  total = 0
  max_so_far = 0
  start = 0
  length = 1
  list.each_with_index do |el, idx|
    length += 1
    total += el
    if total < 0
      start = idx + 1
      length = 1
      total = 0
    end
    if max_so_far < total

      max_so_far = total
    end
  end
  list[start..start+length]
  #list[start..start+length]
end

list = [2, 3, -6, 7, -6, 7]
list1 = [41,2, 3,10,10,10,-100,30,-6,5,5,5 -6, 7]
p largest_subsum_n(list1)
