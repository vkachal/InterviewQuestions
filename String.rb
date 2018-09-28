# 3. // write a function that takes a sorted array of numbers from 1 (lowest) to 99 (max) and returns
# # 4. // a string of the missing numbers as a comma separated list of ranges
# # 5. //  input: array of numbers [1,3,8,9,34]
# # 6. // output: string "2,4-7,10-33,35-99"
#
# find all missing numbers:
#
or_arr = (1..99).to_a
input = [1, 3, 8, 9, 34]

mis_nums = or_arr - input

array = mis_nums.sort.uniq.inject([]) do |spans, n|
  if spans.empty? || spans.last.last != n - 1
    spans + [n..n]
  else
    spans[0..-2] + [spans.last.first..n]
  end
end


def make_string(array)
  str = ""
  return str if array.empty?
  array.each do |range|
    f, l = range.first, range.last
    if range.to_a.uniq.size == 1
      str += "#{f},"
    else
      str = str + "#{f}-#{l},"
    end
  end
  str.chop
end

make_string(array)
