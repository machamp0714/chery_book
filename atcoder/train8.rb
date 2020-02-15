# frozen_string_literal: true

def column_bingo_count(card, num)
  (0..(num - 1)).map { |i| card.map { |row| row[i].zero? }.all? { |bool| bool } }.count { |bingo| bingo }
end

def row_bingo_count(card)
  card.count { |row| row.all?(&:zero?) }
end

def left_cross_bingo_count(card)
  i = 0
  array = []
  card.each do |row|
    array << if row[i].zero?
               true
             else
               false
             end
    i += 1
  end

  if array.all? { |bingo| bingo }
    1
  else
    0
  end
end

def right_cross_bingo_count(card, num)
  i = num - 1
  array = []
  card.each do |row|
    array << if row[i].zero?
               true
             else
               false
             end
    i -= 1
  end

  if array.all? { |bingo| bingo }
    1
  else
    0
  end
end

def row_bingo?(row)
  row.all?(&:zero?)
end

bingo_card = []
numbers = []

N, M = gets.chomp.split.map(&:to_i)
N.times { bingo_card << gets.chomp.split.map(&:to_i) }
(M - 1).times { numbers << gets.chomp.to_i }

result_card = numbers.each_with_object(bingo_card) do |num, result|
  result.map { |row| row[row.index(num)] = 0 unless row.index(num).nil? }
end

remaining_numbers = result_card.map { |row| row.reject(&:zero?) }.flatten

result = remaining_numbers.each_with_object({}) do |remaining_number, hash|
  dup_card = result_card.map(&:dup)

  new_card = dup_card.map do |row|
    if row.index(remaining_number).nil?
      row
    else
      row[row.index(remaining_number)] = 0
      row
    end
  end

  bingo_count = column_bingo_count(new_card, N) + row_bingo_count(new_card) + right_cross_bingo_count(new_card, N) + left_cross_bingo_count(new_card)

  hash.merge!(remaining_number => bingo_count)
end

p result.values.max
