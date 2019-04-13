# 8.9.2 モジュールに他のモジュールをincludeする
# includeはクラスだけでなく、モジュール定義の中でも呼び出せる
module Greeting
  def hello
    'hello.'
  end
end

module Aisatsu
  include Greeting

  def konnitiwa
    'こんにちは'
  end
end

class User
  include Aisatsu
end

user = User.new
p user.konnitiwa
p user.hello