require './card'

class Deck
  class << self
    def make_deck
      [
        Card.new('ハート', 'A'),
        Card.new('ハート', 2),
        Card.new('ハート', 3),
        Card.new('ハート', 4),
        Card.new('ハート', 5),
        Card.new('ハート', 6),
        Card.new('ハート', 7),
        Card.new('ハート', 8),
        Card.new('ハート', 9),
        Card.new('ハート', 10),
        Card.new('ハート', 'J'),
        Card.new('ハート', 'Q'),
        Card.new('ハート', 'K'),
        Card.new('クローバー', 'A'),
        Card.new('クローバー', 2),
        Card.new('クローバー', 3),
        Card.new('クローバー', 4),
        Card.new('クローバー', 5),
        Card.new('クローバー', 6),
        Card.new('クローバー', 7),
        Card.new('クローバー', 8),
        Card.new('クローバー', 9),
        Card.new('クローバー', 10),
        Card.new('クローバー', 'J'),
        Card.new('クローバー', 'Q'),
        Card.new('クローバー', 'K'),
        Card.new('スペード', 'A'),
        Card.new('スペード', 2),
        Card.new('スペード', 3),
        Card.new('スペード', 4),
        Card.new('スペード', 5),
        Card.new('スペード', 6),
        Card.new('スペード', 7),
        Card.new('スペード', 8),
        Card.new('スペード', 9),
        Card.new('スペード', 10),
        Card.new('スペード', 'J'),
        Card.new('スペード', 'Q'),
        Card.new('スペード', 'K'),
        Card.new('ダイア', 'A'),
        Card.new('ダイア', 2),
        Card.new('ダイア', 3),
        Card.new('ダイア', 4),
        Card.new('ダイア', 5),
        Card.new('ダイア', 6),
        Card.new('ダイア', 7),
        Card.new('ダイア', 8),
        Card.new('ダイア', 9),
        Card.new('ダイア', 10),
        Card.new('ダイア', 'J'),
        Card.new('ダイア', 'Q'),
        Card.new('ダイア', 'K')
      ]
    end

    def remove_a_card(deck, card)
      deck.delete(card)
    end

    def shuffle(deck)
      i = deck.length - 1
      while(i > 0)
        j = rand(deck.length - 1)
        deck[j], deck[i] = deck[i], deck[j]
        i -= 1
      end
      deck
    end
  end
end