# def greeting
#   puts 'おはよう'
#   text = yield 'こんにちは', 12345
#   puts text
#   puts 'こんばんは'
# end

# greeting do |text|
#   text * 2
# end
# yieldでやり取りする引数は個数の過不足に寛容
def greeting
  puts 'おはよう'
  text = yield 'こんにちは'
  puts text
  puts 'こんばんは'
end

greeting do |text, other|
  text * 2
end