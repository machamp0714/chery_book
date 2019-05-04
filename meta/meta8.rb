class MyClass
  define_method :my_method do |my_args|
    my_args * 3
  end
end

obj = MyClass.new
p obj.my_method(2)