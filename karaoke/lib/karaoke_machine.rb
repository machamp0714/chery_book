# frozen_string_literal: true

class KaraokeMachine
  # 定数として定義する
  SCALE = %w[C C# D D# E F F# G G# A A# B].freeze

  def initialize(melody)
    @melody = melody
  end

  def transpose(amount)
    # 標準APIを活用して変換用ハッシュ を作成
    converter = [SCALE, SCALE.rotate(amount)].transpose.to_h
    # 正規表現を使って音符のみを抽出
    @melody.gsub(/[A-G]#?/, converter)
  end
end

# いいコードの境界線
# 正規表現の活用
# 標準APIの活用
# 定数やインスタンス変数の使い分け
# for/while/break/next等を避ける
