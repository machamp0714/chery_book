# アクセサメソッド
class Student
  def initialize(name, age)
    @name = name
    @age = age
  end

  attr_accessor :name, :age # アクセサメソッドを使うことで、個々の属性の参照や変更ができる様になる

  def to_s
    puts "名前: #{name} 年齢: #{age}"
  end
end

student1 = Student.new("大出達也", 27)
student2 = Student.new("大出えりさ", 31)

student1.to_s
student2.to_s

student1.age = 28
student2.age = 32

student1.to_s
student2.to_s