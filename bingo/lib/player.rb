require './lib/bingo_card'

class Player
  attr_accessor :right_numbers, :bingo, :card

  def initialize
    @right_numbers = []
    @bingo = false
    @card = BingoCard.new
  end

  def make_a_hole(number)
    key = @card.numbers.key(number)
    @card.numbers[key] = ' '
  end

  def check_bingo
    record = @right_numbers[0][0]
    column = @right_numbers[0][1]
    
    if @right_numbers.select { |position| position[0] == record }.length == 5
      @bingo = true
    elsif @right_numbers.select { |position| position[1] == column }.length == 5
      @bingo = true
    elsif @right_numbers.select { |position| position[0] == position[1] }.length == 4
      @bingo = true
    end
  end
end