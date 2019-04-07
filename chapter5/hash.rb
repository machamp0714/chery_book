# ハッシュ
## 5.2.2 ハッシュを使った繰り返し処理
currencies = { japan: 'yen', us: 'dollar', india: 'rupee' }
currencies.each do |key, value|
    puts "#{key}: #{value}"
end
currencies.each do |key_value|
    key = key_value[0]
    value = key_value[1]
    puts "#{key}: #{value}"
end

## 5.2.3 ハッシュの同値比較、要素数の取得、要素の削除
a = { x: 1, y: 2, z: 3 }
b = { x: 1, y: 2, z: 3 }
p a == b
p a.size
a.delete(:x)
p a
p currencies.delete(:taiwan) # deleteメソッドで指定したキーがなければ、nilが返る
p currencies.delete(:taiwan) { |key| "Not found #{key}" } # ブロックを渡すと、キーが見つからない時の戻り値を作成できる