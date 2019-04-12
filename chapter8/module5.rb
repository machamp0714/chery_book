# 8.5.3 Enumerableモジュール
# Enumerableモジュールは配列やハッシュなど何らかの繰り返し処理ができるクラスにincludeされているモジュール

# include先でeachメソッドが実装されていれば、
# Enumerableモジュールのメソッドが使えるようになる。

# 8.5.4 Comparableモジュール
# Comparableモジュールが使えるようになる条件は、<=>演算子を実装しておく事

class Tempo
  include Comparable

  attr_reader :bpm

  def initialize(bpm)
    @bpm = bpm
  end
  # <=>はComparableモジュールで使われる演算子
  def <=>(other)
    if other.is_a?(Tempo)
      bpm <=> other.bpm
    else
      nil
    end
  end

  def inspect
    "#{bpm}bpm"
  end
end

t_60 = Tempo.new(60)
t_120 = Tempo.new(120)
t_180 = Tempo.new(180)

p t_120 > t_180
p t_120 < t_180
p t_120 == t_180
tempos = [t_60, t_120, t_180]
p tempos.sort