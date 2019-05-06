c = Class.new(Array) do
  def my_method
    "Hello!"
  end
end

p c.class

MyClass = c

p c.name