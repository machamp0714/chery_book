# 7.3.4 クラスメソッド
# クラス内部でメソッドを定義するとそのメソッドはインスタンス変数になります。
# インスタンスメソッドはクラスのインスタンスに対して呼び出すことができるメソッドであり、
# インスタンスに含まれるデータを読み書きする場合はインスタンスメソッドを定義する。

# 一方、そのクラスには関連深いものの、一つ一つのインスタンスに含まれるデータは使わないメソッドを
# 定義したい場合もある。そのような場合は、クラスメソッドを定義する。

class User
  def initialize(name)
    @name = name
  end

  # def self.create_users(names)
  #   names.map do |name|
  #     User.new(name)
  #   end
  # end
  class << self
    def create_users(names)
      names.map do |name|
        User.new(name)
      end
    end
  end

  def hello
    puts "hello, I am #{@name}"
  end
end

names = ['Alice', 'Bob', 'Charol']
users = User.create_users(names)
users.each do |user|
  user.hello
end