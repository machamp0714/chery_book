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