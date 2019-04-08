# ハッシュについてもっと詳しく
## 5.6.1 ハッシュで使用頻度の高いメソッド
currencies = { japan: 'yen', us: 'dollar', india: 'rupee' }
p currencies.keys
p currencies.values
p currencies.has_key?(:italy) # has_key?/key?/include?/member?は全てエイリアスメソッド