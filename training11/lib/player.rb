require './deck'
  
class Player
  attr_reader :hand

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
    "あなたの引いたカードは#{hand.last.suit}の#{hand.last.number}です。"
  end

  def calc_score
    hand.each do |card|
      if card.number == 'A'
        @score += 1
      elsif card.number == 'J'
        @score += 10
      elsif card.number == 'Q'
        @score += 10
      elsif card.number == 'K'
        @score += 10
      else
        @score += card.number
      end
    end
    "あなたの現在の得点は#{@score}です。"
  end

  private
    def remove_a_card(card)
      Deck::DECK.delete(card)
    end
end