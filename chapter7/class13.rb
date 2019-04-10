# 7.7.6 後からメソッドの公開レベルを変更する場合
class User
  def foo
    puts "foo"
  end

  def bar
    puts "bar"
  end

  private :foo, :bar

  def baz
    puts "baz"
  end
end
user = User.new
user.bar
user.baz