require './card'

module Deck
  DECK = [
    Card.new('heart', 'A'),
    Card.new('heart', 2),
    Card.new('heart', 3),
    Card.new('heart', 4),
    Card.new('heart', 5),
    Card.new('heart', 6),
    Card.new('heart', 7),
    Card.new('heart', 8),
    Card.new('heart', 9),
    Card.new('heart', 10),
    Card.new('heart', 'J'),
    Card.new('heart', 'Q'),
    Card.new('heart', 'K'),
    Card.new('clover', 'A'),
    Card.new('clover', 2),
    Card.new('clover', 3),
    Card.new('clover', 4),
    Card.new('clover', 5),
    Card.new('clover', 6),
    Card.new('clover', 7),
    Card.new('clover', 8),
    Card.new('clover', 9),
    Card.new('clover', 10),
    Card.new('clover', 'J'),
    Card.new('clover', 'Q'),
    Card.new('clover', 'K'),
    Card.new('spade', 'A'),
    Card.new('spade', 2),
    Card.new('spade', 3),
    Card.new('spade', 4),
    Card.new('spade', 5),
    Card.new('spade', 6),
    Card.new('spade', 7),
    Card.new('spade', 8),
    Card.new('spade', 9),
    Card.new('spade', 10),
    Card.new('spade', 'J'),
    Card.new('spade', 'Q'),
    Card.new('spade', 'K'),
    Card.new('dia', 'A'),
    Card.new('dia', 2),
    Card.new('dia', 3),
    Card.new('dia', 4),
    Card.new('dia', 5),
    Card.new('dia', 6),
    Card.new('dia', 7),
    Card.new('dia', 8),
    Card.new('dia', 9),
    Card.new('dia', 10),
    Card.new('dia', 'J'),
    Card.new('dia', 'Q'),
    Card.new('dia', 'K')
  ]

  def remove_a_card(card)
    DECK.delete(card)
  end

  def shuffle_deck
    DECK.shuffle!
  end
end