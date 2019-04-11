# メソッドの削除
class User
  undef freeze # freezeメソッドの定義を削除する
end
user = User.new
user.freeze