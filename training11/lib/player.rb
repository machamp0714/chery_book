require './deck'
  
class Player
  attr_reader :hand

  def initialize
    @hand = []
  end

  def draw_a_card
    card = Deck::DECK.sample
    remove_a_card(card)
    @hand << card
  end

  private
    def remove_a_card(card)
      Deck::DECK.delete(card)
    end
end