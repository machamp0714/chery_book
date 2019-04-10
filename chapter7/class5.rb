# 7.5.1 self
class User
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def hello
    p "hello, I am #{name}"
  end

  def hi 
    p "hi, I am #{self.name}"
  end

  def my_name
    p "My name is #{@name}"
  end

  def rename_to_bob
    name = 'Bob'
  end

  def rename_to_carol
    self.name = 'Carol'
  end

  def rename_to_davit
    @name = 'davit'
  end
end
user = User.new('Alice')
user.rename_to_bob
puts user.name
user.rename_to_carol
puts user.name
user.rename_to_davit
puts user.name