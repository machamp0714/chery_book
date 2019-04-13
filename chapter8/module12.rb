# 8.7.4 モジュール関数や定数をもつモジュールの例
p Math.sqrt(2)

class Calculator
  include Math

  def calc_sqrt(n)
    p sqrt(n)
  end
end

calc = Calculator.new
calc.calc_sqrt(3)
p Math::E
p Math::PI