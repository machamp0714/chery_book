## インスタンス変数とアクセサメソッド
class User 
  def initialize(name)
    @name = name
  end

  def hello
    shuffled_name = @name.chars.shuffle.join
    p "hello, I am #{shuffled_name}"
  end
end
user = User.new('Alice')
user.hello