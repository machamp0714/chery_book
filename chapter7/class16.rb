# 7.8.1 定数と再代入
class Product
  # freeze　クラスをfreezeすれば定数の再代入は防げるが、その後でメソッドを定義することも出来なくなってしまう
  DEFAULT_PRICE = 0
end
# Product.freeze   クラスをfreezeすると再代入を防げる
Product::DEFAULT_PRICE = 100 # クラス外部からでも再代入可能
p Product::DEFAULT_PRICE