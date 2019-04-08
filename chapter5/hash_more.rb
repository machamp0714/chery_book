# ハッシュについてもっと詳しく
## 5.6.1 ハッシュで使用頻度の高いメソッド
currencies = { japan: 'yen', us: 'dollar', india: 'rupee' }
p currencies.keys
p currencies.values
p currencies.has_key?(:italy) # has_key?/key?/include?/member?は全てエイリアスメソッド

## 5.6.3 ハッシュを使った擬似キーワード引数
def buy_burger(menu, options = {})
    drink = options[:drink]
    potato = options[:potato]
    if drink && potato
        puts "#{menu}セット: サイドメニューはdrinkとpotato"
    elsif drink
        puts "#{menu}セット: サイドメニューはdrink"
    else
        puts "#{menu}セット: サイドメニューはpotato"
    end
end
buy_burger('cheese_burger', drink: true, potato: true)
buy_burger('cheese_burger', drink: true)
buy_burger('cheese_burger', potato: true)
buy_burger('cheese_burger', drink: true, potato: true, salada: true) # 擬似キーワード引数は単なるハッシュであるため、どんなキーを渡してもエラーにならない

## 5.6.4 任意のキーワードを受け付ける**引数
def buy_item(game, book, **others)
    p others
end
buy_item('pcゲーム', '技術書', frypan: 'アルミパン', iphone: 'iphoneXR')

## 5.6.5 メソッド呼び出し時の{}の省略
## 最後の引数がハッシュであれば、ハッシュリテラルを省略できる
## メソッドの第一引数にハッシュを渡そうとする場合は必ず（）をつけてメソッドを呼び出す必要がある。

## 5.6.6 ハッシュから配列へ、配列からハッシュへ
p currencies.to_a

array = [[:japan, 'yen'], [:us, 'dollar'], [:india, 'rupee']] # ハッシュとして解析不能な配列に対してto_hメソッドを呼ぶと、エラーになる
p array.to_h
p Hash[array]