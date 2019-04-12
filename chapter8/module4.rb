# 8.5.2 include先のメソッドを使うモジュール
module Taggable
  def price_tag
    "#{self.price}円" # selfはinclude先のクラスのインスタンスになる
  end
end

class Product
  include Taggable
  def initialize(price)
    @price = price
  end

  def price
    @price
  end
end

product = Product.new(1000)
p product.price_tag