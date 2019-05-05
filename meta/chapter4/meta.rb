# スコープのフラット化
my_var = 'success!!'

MyClass = Class.new do
  puts = "クラス定義の中は#{my_var}"
  # スコープゲートをメソッド呼び出し変えると、他のスコープ変数が見えるようになる。
  define_method :my_method do
    "メソッド定義の中は#{my_var}"
  end
end

puts MyClass.new.my_method