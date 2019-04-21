require 'date'
class BookInfo
  def initialize(title, author, studay_day, category)
    @title = title
    @author = author
    @studay_day = studay_day
    @category = category
  end

  attr_accessor :title, :author, :studay_day, :category

  def to_s
    "#{title}, #{author}, #@studay_day, #@category"
  end

  def toFormattedString(sep = "\n")
    "書籍名: #{@title}#{sep}著者名: #{@author}#{sep}学習日: #{@studay_day}#{sep}カテゴリー: #{@category}"
  end
end

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
book_infos = { book1: book1, book2: book2 }

book_infos.each do |key, value|
  puts "#{key}:\n\n#{value.toFormattedString}"
  puts "-----------------------------------"
end
