class Product
  DEFAULT_PRICE = 0
  private_constant :DEFAULT_PRICE # 定数をprivateにする
end
p Product::DEFAULT_PRICE # 定数はクラス外部からも参照できる