require './deck'

class User
  attr_reader :role, :hands, :score

  def initialize
    @hands = []
    @score = 0
  end

  def draw_a_card(deck)
    card = deck.last
    Deck.remove_a_card(deck, card)
    @hands << card
  end

  def present_a_card
    puts "#{role}の引いたカードは#{hands.last.suit}の#{hands.last.number}です。"
  end

  def present_score
    puts "#{role}の現在の得点は#{score}です。"
  end

  def calc_score
    total = 0
    hands.each do |card|
      if card.number == 'A'
        total += 1
      elsif card.number == 'J' || card.number == 'Q' || card.number == 'K'
        total += 10
      else
        total += card.number
      end
    end
    @score = total
  end

  def turn(deck)
    draw_a_card(deck)
    present_a_card
    calc_score
    present_score
  end

  def result
    puts "#{role}の得点は#{score}です。"
  end
end