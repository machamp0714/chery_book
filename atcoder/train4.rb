# frozen_string_literal: true

# イルミネーションの調査
class Input
  def self.base
    gets.chomp.split.map(&:to_i)
  end
end

tree_count, safty_zone = Input.base
lights = Input.base
split_count = gets.chomp.to_i
split_array = []
split_count.times { split_array << Input.base }

s = split_array.each_with_object(lights) do |split, result|
  new_array = result.map.with_index { |num, index| num if split[0] - 1 <= index && split[1] > index }.compact

  avarage = new_array.reduce(:+) / new_array.length

  if safty_zone > avarage
    plus = safty_zone - avarage
    hoge = result.map!.with_index do |num, index|
      if split[0] - 1 <= index && split[1] > index
        num + plus
      else
        num
      end
    end
    hoge
  else
    result
  end
end

s.each_with_index do |i, index|
  if index == s.length - 1
    puts i.to_s
  else
    print "#{i} "
  end
end
