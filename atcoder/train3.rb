# frozen_string_literal: true

class Array
  def sort_desc
    sort!.to_a.reverse!
  end

  def rank
    raise "Array is nil!" if length.zero?

    each do |e|
      raise "Element except numerical values exist!" unless e.is_a?(Integer)
    end

    map { |i| count { |j| j > i } + 1 }
  end
end

# 商品の表示
item_num, score_num = gets.chomp.split.map(&:to_i)
table = []
item_num.times do
  table << gets.chomp.split.map(&:to_i)
end

view = (1..item_num).each_with_object({}) do |i, hash|
  hash.merge!(i => table[i - 1])
end

scores = view.each_with_object({}) do |(item_id, scores), hash|
  s = scores.map.with_index do |score, index|
    col = table.transpose[index]
    rank = col.rank

    item_num - rank[col.index(score)]
  end

  hash.merge!(item_id => s.reduce(:+))
end

Hash[scores.sort_by { |_, v| -v }].keys.each { |id| puts id }
