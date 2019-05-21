class BingoCard
  attr_reader :numbers

  def initialize
    @numbers = { [0, 0] => 'B', [0, 1] => 'I', [0, 2] => 'N', [0, 3] => 'G', [0, 4] => 'O' }
    @column_b = [*1..15]
    @column_i = [*16..30]
    @column_n = [*31..45]
    @column_g = [*46..60]
    @column_o = [*61..75]
  end

  def generate_card
    for i in 1..5 do
      for j in 0..4 do
        case j
        when 0
          @numbers[[i, j]] = @column_b.sample
          @column_b.delete(numbers[[i, j]])
        when 1
          @numbers[[i, j]] = @column_i.sample
          @column_i.delete(numbers[[i, j]])
        when 2
          @numbers[[i, j]] = @column_n.sample
          @column_n.delete(numbers[[i, j]])
        when 3
          @numbers[[i, j]] = @column_g.sample
          @column_g.delete(numbers[[i, j]])
        when 4
          @numbers[[i, j]] = @column_o.sample
          @column_o.delete(numbers[[i, j]])
        end
        @numbers[[3, 2]] = ' '
      end
    end
    @numbers
  end

  def view
    record_0 = ''
    record_1 = ''
    record_2 = ''
    record_3 = ''
    record_4 = ''
    record_5 = ''
    for i in 0..5 do
      for j in 0..4 do
        record_0 += @numbers[[i, j]].to_s.rjust(2) + ' | '  if i == 0
        record_1 += @numbers[[i, j]].to_s.rjust(2) + ' | '  if i == 1
        record_2 += @numbers[[i, j]].to_s.rjust(2) + ' | '  if i == 2
        record_3 += @numbers[[i, j]].to_s.rjust(2) + ' | '  if i == 3
        record_4 += @numbers[[i, j]].to_s.rjust(2) + ' | '  if i == 4
        record_5 += @numbers[[i, j]].to_s.rjust(2) + ' | '  if i == 5
      end
    end
      return "#{record_0}\n#{record_1}\n#{record_2}\n#{record_3}\n#{record_4}\n#{record_5}"
  end
end

card = BingoCard.new
card.generate_card
puts card.view