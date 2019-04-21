require '../ruby_ex/bookinfo'
class BookInfoManager
  def initialize
    @book_infos = {}
  end

  def setup
    book1  = BookInfo.new(
      "作りながら学ぶRuby",
      "久保秋真",
      Date.new(2019, 4, 21),
      "Ruby"
    )
    book2 = BookInfo.new(
      "Webを支える技術",
      "山本陽平",
      Date.new(2019, 4, 8),
      "ネットワーク"
    )
    @book_infos[:book1] = book1
    @book_infos[:book2] = book2
  end

  def add_book_info
    puts "書籍を登録します。情報を入力してください。"
    print "キー: "
    key = gets.chomp.to_sym
    print "タイトル: "
    title = gets.chomp
    print "著者名: "
    author = gets.chomp
    print "学習年: "
    studay_year = gets.chomp.to_i
    print "学習月: "
    study_month = gets.chomp.to_i
    print "学習日: "
    studay_date = gets.chomp.to_i
    print "カテゴリー: "
    category = gets.chomp
    book_info = BookInfo.new(title, author, Date.new(studay_year, study_month, studay_date), category)
    @book_infos[key] = book_info 
  end

  def list_all_books
    puts "書籍一覧"
    @book_infos.each do |key, value|
      puts key
      puts value.toFormattedString
      puts "--------------------------"
    end
  end

  def run
    while true
      puts "1: 書籍データ登録"
      puts "2: 書籍データ表示"
      puts "9: 終了"
      print "番号を選んでください(1,2,9):"

      num = gets.chomp.to_i
      case 
      when num == 1
        add_book_info
      when num == 2
        list_all_books
      when num == 9
        break;
      else
        # 選択処理に戻る
      end
    end
  end
end

book_info_manager = BookInfoManager.new
book_info_manager.setup
book_info_manager.run