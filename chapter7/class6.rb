# 7.5.2
class Foo
  puts "#{self}"

  def self.bar
    puts "hello"
  end

  self.bar

  def baz
    puts "#{self}"
    Foo.bar
  end
end
Foo.bar
foo = Foo.new
foo.baz