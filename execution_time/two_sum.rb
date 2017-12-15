def two_sum(arr, target)
  arr1 = arr.sort

  i = 0
  j = arr.length - 1
  while i < arr.length / 2

    if arr1[i] + arr1[j] == target
      return true
    elsif j - i > 1
      j -= 1
    else
      j = arr.length - 1
      i += 1
    end

  end

    false
  end

p two_sum([0, 1, 5, 7], 6)


def two_sum_hash(array,target)
  hash = {}
  array.each do |el|
    hash[el] = true
  end

  array.each do |el|
    return true if hash[target - el] == true
  end
  false
end

p two_sum_hash([0, 1, 5, 7], 6)
