require './user'
require './deck'
  
class Player < User
  def initialize
    super
    @role = 'あなた'
  end

  def first_turn
    2.times do
      draw_a_card
      present_a_card
    end
  end
end