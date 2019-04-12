# 8.5.8 モジュールとインスタンス変数
module NameChanger
  def change_name
    self.name = 'アリス'
  end
end

class User
  include NameChanger

  attr_accessor :name

  def initialize(name)
    @name = name
  end
end

user = User.new('Alice')
p user.change_name