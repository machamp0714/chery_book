# 1. 数の比較

# 浮動小数点リテラルは浮動小数点に近似されるのでこれはfalseになる
100 * 1.1 == 110
# 整数インスタンスに変換する
(100 * 1.1).round == 110
# 有理数インスタンスを使う
100 * 1.1r == 110

# 2. 整数のインクリメント

# イテレータを使う
(10..20).each { |n|  n }
10.upto(20).each { |i|  i }

# 3. 表計算ソフト風の列の名前

# succメソッドを使う
s = "A"
(2019 - 1).times { s.succ! }

# イテレーションの途中でオフセットを使う
ALPHABET = ("A".."Z").to_a
s, q = "", 2019

loop do
  q, r = (q - 1).divmod(26)
  s.prepend(ALPHABET[r])

  break s if q.zero?
end

# 4. 入力された文字列を比較

# loop do
#   # getsメソッドによる入力は、改行が含まれている
#   string = gets.chomp

#   break if string == "exit"
# end

# 5. 文字列の部分一致
string = "|l|l|llll||"
a = "|l|l|lll||"
b = "||l"
c = "l||"

string == a
string.start_with?(b)
string.end_with?(c)

# 6. 禁止された文字列を含むかどうか

s = "llll9llll"
raise "No numbers please!" if s.match?(/\d/)
