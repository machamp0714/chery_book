require './lib/bingo_card'

class Bingo
  @@number = 0

  def take_out_number
    @@number = rand(75)
    "番号は#{@@number}です！"
  end

  def right?(card)
    card.numbers.has_value?(@@number)
  end

  def bingo?(card)
    if card.right_numbers >= 4
      
    else
      false
    end
  end

  def play
    card = BingoCard.new
    count = 0

    puts "☆★☆★☆★☆★☆★☆★ビンゴ大会を始めます！！☆★☆★☆★☆★☆★"
    puts "カードはこちらです！"

    card.generate_card
    puts card.view

    while bingo?(card)
      count += 1
      puts "#{count}回目！"
      puts take_out_number

      if right?(card)
        puts "当たり！"
        card.add(@@number)
        card.make_a_hole(@@number)
        puts card.view
      else
        puts "ハズれでした！次！"
      end
    end

    puts "ビンゴ大会は終了です！ありがとうございました！"
  end
end

game = Bingo.new
game.play