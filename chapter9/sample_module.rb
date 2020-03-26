module SampleModule

  # Moduleがextendされた時に呼び出されるフック
  def self.extended(base)
    puts "#{self} extended in #{base}."
  end

  def hello
    puts "hello"
  end

  def night
    puts "おやすみ"
  end
end

class MyClass
  extend SampleModule
end

MyClass.hello

# SampleModule extended in MyClass.
# hello
