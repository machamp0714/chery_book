N = gets.chomp.to_i
circle = []
N.times do
  circle << gets.chomp.split.map(&:to_i)
end

# 0の位置(i, j)を求める。 [[i, j], [i, j]]
def zero_position(circle, num)
  (0..(num - 1)).map do |i|
    (0..(num - 1)).map do |j|
      [i, j] if circle[i][j].zero?
    end
  end.map(&:compact).flatten(1)
end

# 0が横方向に存在するかどうか
def row_zero_exists?(zero_positions)
  zero_positions[0][0] == zero_positions[1][0]
end

# 0を含まない配列を調べて、総和を求める
sum = circle.find { |row| row.all? { |i| !i.zero? } }.reduce(:+)

# 0の位置(i, j)を要素にもつ2次元配列
zero_positions = zero_position(circle, N)

# (i, j)に入る未知数Xを求める。
result = zero_positions.each_with_object({}) do |(i, j), hash|
  array = if row_zero_exists?(zero_positions)
            circle.transpose[j]
          else
            circle[i]
          end
  x = sum - array.reject(&:zero?).reduce(:+)

  hash.merge!([i, j] => x)
end

# circleの0をXに置換する
result.each do |key, value|
  i = key[0]
  j = key[1]

  circle[i][j] = value
end

# 魔法陣を出力する
circle.each { |row| puts row.join(" ") }
