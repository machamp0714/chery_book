# 7.10.9 ダックタイピング
class User
  def name
    'Alice'
  end
end

class Product
  def name
    'movie'
  end
end

def display_name(object)
  puts "Name is <<#{object.name}>>"
end

user = User.new
product = Product.new

display_name(user)
display_name(product)