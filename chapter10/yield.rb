# def greeting 
#   puts 'おはよう'
#   if block_given?   # ブロックが渡されたかどうか確認するブロック
#     yield           # 渡されたブロックを実行する
#   end
#   puts 'こんばんは'
# end

# greeting 

# def greeting
#   puts 'おはよう'
#   # ブロックに引数を渡し、戻り値を受け取る
#   text = yield 'こんにちは'
#   puts text
#   puts 'こんばんは'
# end

# greeting do |text|
#   text * 2
# end

# yieldとブロックでやり取りする引数は個数の過不足に寛容。
def greeting
  puts 'おはよう'
  text = yield 'こんにちは', 12345
  puts text
  puts 'こんばんは'
end
# ブロックの引数が１つであれば、２つ目は無視される
greeting do |text|
  text * 2
end

def greeting
  puts 'おはよう'
  text = yield 'こんにちは'
  puts text
  puts 'こんばんは'
end

greeting do |text, other|
  text * 2 + other.inspect
end