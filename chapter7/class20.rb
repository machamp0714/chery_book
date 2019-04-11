# 7.10.3 ネストしたクラスの定義
class User
  class BloodType
    attr_reader :type

    def initialize(type)
      @type = type
    end
  end
end

blood_type = User::BloodType.new('B') # ネストしたクラスは [外側のクラス::内側のクラス]で呼び出すことが出来る
p blood_type.type