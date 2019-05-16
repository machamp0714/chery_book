require './deck'

class User
  include Deck

  attr_reader :hand, :score

  def initialize
    @hand = []
    @score = 0
  end

  def draw_a_card
    card = Deck::DECK.sample
    remove_a_card(card)
    @hand << card
  end

  def present_a_card
    case self
    when Player
      puts "あなたの引いたカードは#{hand.last.suit}の#{hand.last.number}です。"
    when Dealer
      puts "ディーラーの引いたカードは#{hand.last.suit}の#{hand.last.number}です。"
    end
  end
  
  def calc_score
    total = 0
    hand.each do |card|
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

  def present_score
    case self
    when Player
      puts "あなたの現在の得点は#{score}です。"
    when Dealer
      puts "ディーラーの現在の得点は#{score}です。"
    end
  end
end