# frozen_string_literal: true

# paiza 1
# input_inline = gets.chomp
# if input_inline.to_i.even?
#   puts "OFF"
# else
#   puts "ON"
# end

# paiza 2
# N を 2 以上の整数とし、N の約数のうち N 自身を除いたものの和を S とします。 このとき

# ・N = S となるような N を完全数
# ・|N-S| = 1 となるような N をほぼ完全数

# と言うことにしましょう。ここで、|N-S| は N-S の絶対値を意味します。

# たとえば、N = 28 のとき、28 の約数は 1, 2, 4, 7, 14, 28 なので、S = 1+2+4+7+14 = 28 となります。従って、28 は完全数です。
# また、N = 16 のときには S = 1+2+4+8 = 15 となるので、16 はほぼ完全数です。

# 入力された整数が完全数かほぼ完全数かそのいずれでもないかを判定するプログラムを作成してください。
# count = gets.chomp.to_i
# input_inlines = []
# count.times do
#   num = gets.chomp.to_i
#   input_inlines << num
# end

# input_inlines.each do |num|
#   # Rubyでループ文を書く場合、each,updo,selectメソッドで書けないか検討する。
#   divisors = (1..num - 1).select { |i| (num % i).zero? }
#   sum = divisors.reduce(:+)

#   if num == sum
#     puts "perfect"
#   elsif (num - sum).abs == 1
#     puts "nearly"
#   else
#     puts "neither"
#   end
# end

# paiza Leet文字列
# input_inline = gets.chomp
# puts input_inline.tr("AEGIOSZ", "4361052")

# paiza カード並べ
# input_inline = gets.chomp
# cards = input_inline.split
# sum = []
# cards.permutation.to_a.each do |a1, a2, a3, a4|
#   sum << (a1 + a2).to_i + (a3 + a4).to_i
# end

