require './deck'

class User
  attr_reader :role, :hand, :score

  def initialize(role)
    @hands = []
    @score = 0
    @role = role
  end

  include Deck

  def draw_a_card
    card = Deck::DECK.last
    remove_a_card(card)
    @hands << card
  end

  def present_a_card
    puts "#{role}の引いたカードは#{hands.last.suit}の#{hands.last.number.to_s}です。"
  end

  def present_score
    puts "#{role}の現在の得点は#{score}です。"
  end

  def calc_score
    total = 0
    hands.each do |card|
      if card.number == 'A'
        total += 1
      elsif card.number == 'J'
        total += 10
      elsif card.number == 'Q'
        total += 10
      elsif card.number == 'K'
        total += 10
      else
        total += card.number
      end
    end
    @score = total
  end

  def turn
    draw_a_card
    present_a_card
    calc_score
    present_score
  end

  def result
    puts "#{role}の得点は#{score}です。"
  end
end