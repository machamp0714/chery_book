class MyClass
  def initialize(value)
    @x = value
  end

  def my_method
    @x
  end
end

obj = MyClass.new(10)
m = obj.method :my_method # Object#methodを呼び出すと、メソッドそのものをMethodオブジェクトとして取得できる。
p m.class
p m.call # MethodオブジェクトはMethod#callで呼び出せる。