class Gear
  attr_reader :chainring, :cog, :wheel

  def initialize(chainring, cog, wheel=nil) # インスタンス変数は常にアクセサメソッドで包み、直接参照しない様にする
    @chainring = chainring
    @cog = cog
    @wheel = wheel
  end

  def ratio
    chainring / cog.to_f
  end

  # def ratio
  #   @chainring / @cog.to_f 破滅への道
  # end

  def gear_inches
    begin
      ratio * wheel.diameter
    rescue NoMethodError => e
      puts e.class
      puts 'wheel属性が必要です。'
    end
  end
end

class Wheel
  attr_reader :rim, :tire

  def initialize(rim, tire)
    @rim = rim
    @tire = tire
  end

  def diameter
    rim + (tire * 2)
  end

  def circumference
    diameter * Math::PI
  end
end

wheel = Wheel.new(26, 1.5)
gear = Gear.new(52, 11, wheel)
p gear.gear_inches
gear2 = Gear.new(52, 11)
p gear2.gear_inches