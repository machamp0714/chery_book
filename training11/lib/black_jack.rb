require './player'
require './deck'

class BlackJack
  def first_turn(player)
    2.times do
      player.draw_a_card
      puts player.present_a_card
    end
  end

  def play
    player = Player.new

    puts "☆★☆★☆★☆★☆★ ブラックジャックへようこそ！ ☆★☆★☆★☆★☆★"
    puts "ゲームを開始します。"

    first_turn(player)
    puts player.calc_score

    puts "カードを引きますか？引く場合はYを、引かない場合はNを入力してください"
    answer = gets.chomp
    
  end
end

game = BlackJack.new
game.play