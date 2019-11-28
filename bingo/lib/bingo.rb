# frozen_string_literal: true

#  B |  I |  N |  G |  O
# 13 | 22 | 32 | 48 | 61
#  3 | 23 | 43 | 53 | 63
#  4 | 19 |    | 60 | 65
# 12 | 16 | 44 | 50 | 75
#  2 | 28 | 33 | 56 | 68

class Bingo
  class Array
    def make_a_hole
      map.with_index { |c, index| index == 2 ? ' ' : c }
    end
  end

  def to_s
    body.each { |row| puts row.join(' | ') }
  end

  def body
    bingo_numbers.unshift(header).map { |array| array.map { |c| c.rjust(2) } }
  end

  def header
    %w[B I N G O]
  end

  def bingo_numbers
    [column(:B), column(:I), column(:N).make_a_hole, column(:G), column(:O)].transpose
  end

  def column(col)
    convertor = {
      B: [*1..15],
      I: [*16..30],
      N: [*31..45],
      G: [*46..60],
      O: [*61..75]
    }
    convertor[col].shuffle.take(5).map(&:to_s)
  end
end

bingo = Bingo.new
bingo.to_s
