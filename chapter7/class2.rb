# 7.3.3
class User
  def initialize(name)
    @name = name
  end

  attr_accessor :name # インスタンス変数を外部から読み書きできるようにするメソッド

  # def name # インスタンス変数は外部から参照することが出来ない
  #   @name
  # end

  # def name=(value) インスタンス変数は外部から変更することが出来ない
  #   @name = value
  # end
end
user = User.new('Alice')
p user.name
user.name = 'Bob'
p user.name