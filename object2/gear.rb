class Gear
  attr_reader :chainring, :cog, :rim, :tire

  def initialize(chainring, cog, rim, tire) # インスタンス変数は常にアクセサメソッドで包み、直接参照しない様にする
    @chainring = chainring
    @cog = cog
    @rim = rim
    @tire = tire
  end

  def ratio
    chainring / cog.to_f
  end

  # def ratio
  #   @chainring / @cog.to_f 破滅への道
  # end

  def gear_inches
    ratio * (rim + (tire * 2))
  end
end

gear = Gear.new(52, 11, 26, 1.5)
p gear.gear_inches

# gear2 = Gear.new(52, 11) メソッドに必要な引数の数の変更は、そのメソッドを呼び出している箇所の全てを壊す
# p gear2.ratio