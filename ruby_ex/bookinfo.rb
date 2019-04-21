require 'date'
class BookInfo
  def initialize(title, author, studay_day, category)
    @title = title
    @author = author
    @study_day = study_day
    @category = category
  end

  attr_accessor :title, :author, :study_day, :category

  def to_s
    "#{title}, #{author}, #@study_day, #@category"
  end

  def toFormattedString(sep = "\n")
    "書籍名: #{@title}#{sep}著者名: #{@author}#{sep}学習日: #{@study_day}#{sep}カテゴリー: #{@category}"
  end
end

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
    study_year = gets.chomp.to_i
    print "学習月: "
    study_month = gets.chomp.to_i
    print "学習日: "
    study_date = gets.chomp.to_i
    print "カテゴリー: "
    category = gets.chomp
    book_info = BookInfo.new(title, author, Date.new(study_year, study_month, study_date), category)
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

  def search_book
    results = []
    puts "書籍を検索します。"
    print "キーワードを入力してください:"
    keyword = gets.chomp
    @book_infos.each_value do |book|
      if book.title.include?(keyword)
        results << book
      elsif book.author.include?(keyword)
        results << book
      elsif book.category.include?(keyword)
        results << book
      end
    end
    if results.size > 0
      search_result(results)
    else
      puts "検索条件に一致する結果は見つかりませんでした。"
    end
  end

  def search_result(results)
    puts "検索結果"
    results.each do |book|
      puts book.toFormattedString
    end
  end

  def run
    while true
      puts "1: 書籍データ登録"
      puts "2: 書籍データ表示"
      puts "3: 書籍データを検索する"
      puts "9: 終了"
      print "番号を選んでください(1,2,3,9):"

      num = gets.chomp.to_i
      case 
      when num == 1
        add_book_info
      when num == 2
        list_all_books
      when num == 3
        search_book
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