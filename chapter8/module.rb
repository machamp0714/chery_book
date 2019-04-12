# モジュールとは
# モジュールからインスランスを作成することはできない
# 他のモジュールやクラスを継承することはできない

# 8.3.1 モジュールをクラスにincludeする
module Loggable
  private
    def log(text)
      puts "[LOG] #{text}"
    end
end

class Product
  include Loggable # モジュールをクラスにincludeして機能を追加することをミックスインと言う。

  def title
    log 'title is called.'
    puts 'A greate movie'
  end
end

class User 
  include Loggable

  def name
    log 'name is called.'
    puts 'Alice'
  end
end

product = Product.new
product.title

user = User.new
user.name

product.log 'public?'