class Product
  attr_reader :code, :name

  def initialize(code, name)
    @code = code
    @name = name
  end

  def ==(other) # Objectクラスのメソッド==を再定義する
    if other.is_a?(Product) # is_a?= レシーバのオブジェクトが引数のクラスと一致すればtrueを返す
      code == other.code
    else
      false
    end
  end
end

a = Product.new('A001', 'A')
b = Product.new('B001', 'B')
c = Product.new('A001', 'C')

p a == b
p a == c # trueという結果が欲しい
