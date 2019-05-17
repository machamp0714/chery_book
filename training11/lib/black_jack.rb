require './user'
require './player'
require './dealer'
require './deck'

class BlackJack
  
  def judge(player, dealer)
    player_score = (player.score - 21).abs
    dealer_score = (dealer.score - 21).abs

    if player_score < dealer_score
      puts "あなたの勝ちです。"
    elsif player_score > dealer_score
      puts "ディーラーの勝ちです。"
    else
      puts "引き分けです。"
    end
  end

  def play
    player = Player.new('あなた')
    dealer = Dealer.new('ディーラー')

    puts "☆★☆★☆★☆★☆★ ブラックジャックへようこそ！ ☆★☆★☆★☆★☆★"
    puts "ゲームを開始します。"

    player.first_turn
    dealer.first_turn

    player.calc_score
    player.present_score

    while (player.score < 22)
      puts "カードを引きますか？引く場合はYを、引かない場合はNを入力してください"
      answer = gets.chomp

      case answer
      when 'Y'
        player.turn
      when 'N'
        puts "あなたのターンは終了です。\n次はディーラーのターンです。"
        break
      end
    end

    if (player.score >= 22)
      puts "ディーラーの勝ちです！"
    else
      puts "ディーラーの２枚目のカードは#{dealer.hand.last.suit}の#{dealer.hand.last.number.to_s}でした。"

      dealer.calc_score

      while(dealer.score <= 17)
        dealer.turn
      end

      if (dealer.score >= 22)
        puts "#{player.role}の勝ちです！"
      else
        player.result
        dealer.result
        judge(player, dealer)
      end
    end
  end
end

game = BlackJack.new
game.play