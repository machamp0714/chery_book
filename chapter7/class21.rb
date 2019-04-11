# 7.10.4 演算子の挙動を独自に再定義する
class User
  def name=(value)
    @name = value
  end
end

user = User.new
user.name='Alice'