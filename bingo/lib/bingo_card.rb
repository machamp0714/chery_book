class BingoCard
  attr_reader :numbers

  def initialize
    @numbers = {}
    @right_numbers = {}
  end

  def generate_card
    for r in 1..5 do
      for c in 1..5 do
        case c
        when 1
          set_number(r, c, [*1..15])
        when 2
          set_number(r, c, [*16..30])
        when 3
          set_number(r, c, [*31..45])
        when 4
          set_number(r, c, [*46..60])
        when 5
          set_number(r, c, [*61..75])
        end
        @numbers[[3, 3]] = ' '
      end
    end
    @numbers
  end

  def view
    record_0 = %w(B I N G O).map { |e| e.rjust(2) }.join(' | ').concat(' | ')
    record_1 = ''
    record_2 = ''
    record_3 = ''
    record_4 = ''
    record_5 = ''
    for r in 1..5 do
      for c in 1..5 do
        record_1 += @numbers[[r, c]].to_s.rjust(2) + ' | '  if r == 1
        record_2 += @numbers[[r, c]].to_s.rjust(2) + ' | '  if r == 2
        record_3 += @numbers[[r, c]].to_s.rjust(2) + ' | '  if r == 3
        record_4 += @numbers[[r, c]].to_s.rjust(2) + ' | '  if r == 4
        record_5 += @numbers[[r, c]].to_s.rjust(2) + ' | '  if r == 5
      end
    end
      return "#{record_0}\n#{record_1}\n#{record_2}\n#{record_3}\n#{record_4}\n#{record_5}"
  end

  def set_number(r, c, column)
    @numbers[[r, c]] = column.sample
    column.delete(@numbers[[r, c]])
  end

  def add(right_number)
    key = @numbers.key(right_number)
    @right_numbers[key] = right_number
  end

  def make_a_hole(right_number)
    key = @numbers.key(right_number)
    @numbers[key] = ' '
  end
end