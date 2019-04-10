# 7.3.5 定数
# クラスの中には定数を定義することもできる
class Product
  DEFAULT_PRICE = 0

  attr_accessor :name, :price

  def initialize(name, price=DEFAULT_PRICE)
    @name = name
    @price = price
  end
end

product = Product.new('A free movie')
p "価格: #{product.price}円"