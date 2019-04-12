# 8.3.2 モジュールをextendする
module Loggable
  def log(text)
    puts "[LOG] #{text}"
  end
end

class Product
  extend Loggable # extendを使うと、モジュール内のメソッドをそのクラスの特異メソッドにする事が出来る。

  def self.create_products(names)
    log 'create_products is called.'
  end
end

Product.create_products([])
Product.log 'Hello' 