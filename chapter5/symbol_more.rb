# シンボルについてもっと詳しく
## 5.7.2 %記法でシンボルやシンボルの配列を作成する
p %s!ruby is fun! # !を区切り文字に使う
p %s(ruby is fun) # ()を区切り文字に使う

p %i(apple orange melon)

## 5.7.3 シンボルと文字列の関係
string = 'apple'
symbol = :apple
p string == symbol
p string.to_sym == symbol
p string + symbol.to_s

p 'apple'.respond_to?('include?')
p 'apple'.respond_to?(:include?)