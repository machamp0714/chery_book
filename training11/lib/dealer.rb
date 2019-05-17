require './user'

class Dealer < User
  def initialize(role)
    super
  end

  def first_turn
    draw_a_card
    present_a_card
    draw_a_card
    puts "ディーラーの2枚目のカードは分かりません。"
  end
end