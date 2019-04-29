class Gear
  attr_reader :chainring, :cog, :wheel

  def initialize(args) # インスタンス変数は常にアクセサメソッドで包み、直接参照しない様にする
    args = defaults.merge(args)
    @chainring = args[:chainring]
    @cog = args[:cog]
    @wheel = args[:wheel]
  end

  def defaults
    { chainring: 40, cog: 18 }
  end

  def ratio
    chainring / cog.to_f
  end

  # def ratio
  #   @chainring / @cog.to_f 破滅への道
  # end

  def gear_inches
    begin
      ratio * diameter
    rescue NoMethodError => e
      puts e.class
      puts 'wheel属性が必要です。'
    end
  end

  def diameter
    wheel.diameter
  end

  def wheel # GearがWheelに依存していることが公然となる。
    @wheel ||= Wheel.new(rim, tire)
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

p Gear.new({ chainring: 11, cog: 23, wheel: Wheel.new(26, 1.5) }).gear_inches