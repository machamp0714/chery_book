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
    player = Player.new
    dealer = Dealer.new
    deck = Deck.make_deck

    puts "☆★☆★☆★☆★☆★ ブラックジャックへようこそ！ ☆★☆★☆★☆★☆★"
    puts "ゲームを開始します。"

    Deck.shuffle(deck)

    player.first_turn(deck)
    dealer.first_turn(deck)

    # プレイヤーのターン

    player.calc_score
    player.present_score

    while (player.score < 22)
      begin
        puts "カードを引きますか？引く場合はYを、引かない場合はNを入力してください"
        answer = gets.chomp
      rescue
        raise
        retry
      end

      case answer
      when 'Y'
        player.turn(deck)
      when 'N'
        puts "あなたのターンは終了です。\n次はディーラーのターンです。"
        break
      end
    end

    # ディーラーのターン

    if (player.score >= 22)
      puts "ディーラーの勝ちです！"
    else
      puts "ディーラーの２枚目のカードは#{dealer.hands.last.suit}の#{dealer.hands.last.number}でした。"

      dealer.calc_score

      while(dealer.score <= 17)
        dealer.turn(deck)
      end

      if (dealer.score >= 22)
        puts "#{player.role}の勝ちです！"
      else
        player.result
        dealer.result
        judge(player, dealer)
      end
    end
    puts "ブラックジャック終了！また遊んでね！"
  end
end

game = BlackJack.new
game.play