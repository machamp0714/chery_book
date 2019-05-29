require './lib/bingo_card'
require './lib/player'

class Bingo
  def take_out_number
    @@number = rand(75)
  end

  def bingo?(players)
    players.each do |player|
      player.bingo
    end
  end

  def play
    player1 = Player.new
    players = [player1]

    puts "☆★☆★☆★☆★☆★ビンゴゲームを始めます！☆★☆★☆★☆★☆★"

    puts "参加者のカードはこちら！"
    player1.card.generate_card
    puts player1.card.view

    while bingo?(players)
      take_out_number

      players.each do |player|
        if player.card.right?(@@number)
          number = player.card.numbers.key(@@number)
          player.right_numbers << number

          player.make_a_hole(@@number)

          player.check_bingo
        end
        puts "カードの状況はこちら"
        puts player.card.view
      end
    end

    puts "ビンゴゲーム終わり！！"
  end
end

game = Bingo.new
game.play