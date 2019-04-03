## 4.7.6 1つの配列を複数の引数として展開する
a = []
b = [2, 3]
a.push(1)
p a.push(*b) # *を使って配列を展開出来る

## 4.7.7 メソッドの可変長引数
def greeting(*names) # 個数に制限のない引数のことを可変長引数という。
    "#{names.join('と')},こんにちは"
end

p greeting('田中さん')
p greeting('田中さん', '鈴木さん')
names = ['大出さん', '石川さん']
p greeting(names)

# 4.7.8 *で配列同士を非破壊的に連結する
a = [3, 4, 5]
p [*a] # 配列の前に*をつけると配列が展開される
p [-1 , 0, 1, 2, *a]

## 4.7.9 ==で等しい配列かどうか判断する
p [1, 2, 3] == [1, 2, 3]

## 4.7.10 %記法で文字列の配列を簡潔に作る
p %w(apple melon orrange) 
p %w!apple melon orrange! # 文字列を``で囲む必要がない
p %w(big\ apple small\ melon orrange)

## 4.7.11 文字列を配列に変換する
p 'Ruby'.chars # 文字列中の１文字１文字を配列に分解する

p 'Ruby,Java,PHP,Python'.split(',')

## 4.7.12 配列を初期値を設定する
a = Array.new(5) # 要素が５個の配列を作成
p a
a = Array.new(5, 0)
p a
a = Array.new(10) { |n| n % 3 + 1 }
p a

## 4.7.13 配列に初期値を設定する場合の注意点
a = Array.new(5, 'default')
str = a[0]
str.upcase! # 配列の要素全てが置き換わる。破壊的
p a
b = Array.new(5) { 'default' } # ブロックが呼ばれる度に文字列が作成されるので、各要素は別々の文字列を参照することになる。
str2 = b[0]
str2.upcase!
p b

## 4.7.14 ニュータブル？イミュータブル？
# ミュータブルなオブジェクトには破壊的な変更が適用される。
# Stringクラスはミュータブルなので上記のような不具合が起きる可能性がある。
# イミュータブルなオブジェクトの例は
# 数値（IntegerクラスやFloatクラス）
# シンボル
# true/false
# nil