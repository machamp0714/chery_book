require './user'
require './player'
require './deck'

class BlackJack
  def first_turn(player)
    2.times do
      player.draw_a_card
      player.present_a_card
    end
  end

  def play
    player = Player.new

    puts "☆★☆★☆★☆★☆★ ブラックジャックへようこそ！ ☆★☆★☆★☆★☆★"
    puts "ゲームを開始します。"

    first_turn(player)
    player.calc_score

    while (player.score < 22)
      puts "カードを引きますか？引く場合はYを、引かない場合はNを入力してください"
      answer = gets.chomp

      case answer
      when 'Y'
        player.draw_a_card
        player.present_a_card
        player.calc_score
      when 'N'
        puts "あなたのターンは終了です。\n次はディーラーのターンです。"
        break
      end
    end

    if (player.score >= 22)
      puts "あなたの負けです。"
    end
  end
end

game = BlackJack.new
game.play