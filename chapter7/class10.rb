# 7.7.2 privateメソッド
class User
  def hello
    "Hello, my name is #{name}" # self.nameとするとエラーが出る
  end

  private # privateメソッドはレシーバを指定できない
    def name
      "Alice"
    end
end
user = User.new
p user.hello