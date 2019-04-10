# 定数はミュータブルなオブジェクトに注意する
class Product
  NAME = 'A product'
  SOME_NAMES = ['Foo', 'Bar', 'Baz'].freeze
  SOME_PRICES = { Foo: 100, Bar: 200, Baz: 300 }

  def self.names_without_foo(names = SOME_NAMES)
    names.delete('Foo')
    p names
  end
end

p Product::NAME.upcase!
Product::SOME_NAMES << 'Hoge'
p Product::SOME_NAMES
Product::SOME_PRICES[:Hoge] = 400
p Product::SOME_PRICES
# Product.names_without_foo
Product::SOME_NAMES[0].upcase!
p Product::SOME_NAMES