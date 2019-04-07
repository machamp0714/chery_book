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