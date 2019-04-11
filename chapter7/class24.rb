# 7.10.6 オープンんクラスとモンキーパッチ
class MyString < String
  # Stringクラスを拡張するコードを書く
end
s = MyString.new('hello') # rubyは組み込みライブラリのクラスであっても継承して独自のクラスを定義することが出来る
p s.class

class String
  def shuffle # 新しいメソッドを追加
    chars.shuffle.join
  end
end

s = 'Hello, I am Alice'
p s.shuffle

class User
  def initialize(name)
    @name = name
  end

  def hello
    "Hello, #{@name}!"
  end
end

user = User.new('Alice')
p user.hello 

class User
  # def hello
  #   "#{@name}さん、こんにちは！" helloメソッドにモンキーパッチを当てて独自の挙動を持たせる
  # end
  alias hello_orizinal hello

  def hello
    "#{@name}さん、こんにちは！"
  end
end
p user.hello_orizinal
p user.hello