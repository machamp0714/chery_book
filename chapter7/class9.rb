# 7.6.7 クラスメソッドの継承
class Foo
  def self.hello
    puts "helo"
  end
end

class Bar < Foo

end
Bar.hello