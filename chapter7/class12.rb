# 7.7.4 クラスメソッドをprivateにする
class User
  # private

  #   def self.hello クラスメソッドはprivateにならない
  #     puts "hello"
  #   end

  # class << self
  #   private
  #     def hello
  #       puts "hello"
  #     end
  # end

  def self.hello
    puts "hello"
  end
  private_class_method :hello # 後からクラスメソッドをprivateにする
end
User.hello