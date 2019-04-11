# 7.10.7 特異メソッド
# rubyでは、オブジェクト単位で挙動を変えることが出来る
alice = 'I am Alice'
bob = 'I am Bob'

# def alice.shuffle  aliceオブジェクトにだけ、shuffleメソッドを定義する
#   chars.shuffle.join
# end

# n = 1  数値やシンボルには特異メソッドを定義することが出来ない
# def n.foo
#   'foo'
# end

# sym = :alice
# def sym.bar
#   'bar'
# end

class << alice
  def shuffle
    chars.shuffle.join
  end
end
p alice.shuffle