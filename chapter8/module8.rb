# 8.6.1 名前空間を分けて名前の衝突を防ぐ
# 同名のSecondクラスを区別できるようにする
module Baseball
  class Second
    def initialize(player, uniform_number)
      @player = player
      @uniform_number = uniform_number
    end

    def player_name
      @player
    end
  end
end

module Clock
  class Second
    def initialize(digits)
      @digits = digits
    end
  end
end

second = Baseball::Second.new('Alice', 4)
s = Clock::Second.new(13)

p second.player_name