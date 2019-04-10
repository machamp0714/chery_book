# 7.5.3
class Product
  attr_accessor :name, :price

  def initialize(name, price)
    @name = name
    @price = price
  end

  def self.format_price(price)
    "#{price}円"
  end

  def to_s
    formatted_price = self.class.format_price(price)
    puts "name: #{name}, price: #{formatted_price}"
  end
end

product = Product.new("iphone", 1000)
product.to_s