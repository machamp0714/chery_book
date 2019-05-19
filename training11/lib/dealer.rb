require './user'

class Dealer < User
  def initialize
    super
    @role = 'ディーラー'
  end

  def first_turn(deck)
    draw_a_card(deck)
    present_a_card
    draw_a_card(deck)
    puts "ディーラーの2枚目のカードは分かりません。"
  end
end