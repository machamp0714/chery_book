# 8.7.2 module_functioメソッド
module Loggable
  def log(text)
    puts "[LOG] #{text}"
  end
  # logメソッドをミックスインとしても、モジュールの特異メソッドとしても使えるようにする
  # module_functionは対象のメソッドより下で定義する
  module_function :log
end

Loggable.log('hello')

class Product
  include Loggable

  def title
    log 'A great movie'
  end
end

product = Product.new
product.title
# product.log('hello') module_functionでモジュール関数となったメソッドは、他のクラスに
# ミックスインすると自動的にprivateメソッドになる

