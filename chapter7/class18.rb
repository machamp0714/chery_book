# 7.10.1 エイリアスメソッドの定義
class User
  def hello
    'Hello'
  end

  alias greeting hello # helloメソッドのエイリアスメソッドとしてgreetingを定義する
end
user = User.new
p user.hello
p user.greeting