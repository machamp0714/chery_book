# 8.5.9 オブジェクトに直接ミックスインする
module Loggable
  def log(text)
    puts "[LOG] #{text}"
  end
end
# s.log('hello') 文字列は通常logメソッドを持たない
s = 'abc'
s.extend(Loggable) # モジュールのメソッドを特異メソッドとしてミックスインする
s.log('hello')