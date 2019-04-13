# 8.7.1 モジュールに特異メソッドを定義する
module Loggable
  def self.log(text) 
    puts "[LOG] #{text}"
  end
end

Loggable.log('hello')