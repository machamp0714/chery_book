# frozen_string_literal: true

# 入力
# 5 5
# 1 2
# 3 4

# 出力
# 1 2 3 4 5
# 3 4 5 6 7
# 5 6 7 8 9
# 7 8 9 10 11
# 9 10 11 12 13

def tousa(array, length)
  a, b = array
  interval = b - a
  x = length - 2
  while x.positive?
    array << array.last + interval
    x -= 1
  end
  array
end

def table(row1, row2, row_num, col_num)
  i = 0
  table = []
  while i < col_num
    table << tousa([row1[i], row2[i]], row_num)
    i += 1
  end
  table
end

row_num, col_num = gets.chomp.split.map(&:to_i)
row1 = gets.chomp.split.map(&:to_i)
row2 = gets.chomp.split.map(&:to_i)
table = table(tousa(row1, col_num), tousa(row2, col_num), row_num, col_num)

table.transpose.each do |row|
  puts row.join(" ")
end
