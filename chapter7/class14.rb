# 7.7.7 protectedメソッド
class User
  attr_reader :name

  def initialize(name, weight)
    @name = name
    @weight = weight
  end

  def heavier_than?(other_user)
    @weight > other_user.weight
  end

  def weight
    @weight
  end

  protected :weight

  # protected    そのクラス自身とサブクラスからレシーバ付きで呼び出せる
  #   def weight
  #     @weight
  #   end
end
user = User.new("alice", 48)
other_user = User.new("bob", 53)

p user.heavier_than?(other_user)
p other_user.heavier_than?(user)