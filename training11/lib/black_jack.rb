require './user'
require './player'
require './dealer'
require './deck'

class BlackJack
  def first_turn(user)
    case user
    when Player
      2.times do
        user.draw_a_card
        user.present_a_card
      end
    when Dealer
      user.draw_a_card
      puts "ディーラーの引いたカードは#{user.hand[0].suit}の#{user.hand[0].number}です。"
      user.draw_a_card
      puts "ディーラーの２枚目のカードは分かりません。"
    end
  end

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
    player = Player.new
    dealer = Dealer.new

    puts "☆★☆★☆★☆★☆★ ブラックジャックへようこそ！ ☆★☆★☆★☆★☆★"
    puts "ゲームを開始します。"

    first_turn(player)
    first_turn(dealer)

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
    else
      puts "ディーラーの２枚目のカードは#{dealer.hand.last.suit}の#{dealer.hand.last.number}でした。"

      dealer.calc_score

      while(dealer.score <= 17)
        dealer.draw_a_card
        puts "ディーラーの引いたカードは#{dealer.hand.last.suit}の#{dealer.hand.last.number}です。"
        dealer.calc_score
      end

      puts "あなたの得点は#{player.score}です。"
      puts "ディーラーの得点は#{dealer.score}です。"

      judge(player, dealer)
    end
  end
end

game = BlackJack.new
game.play