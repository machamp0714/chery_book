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

book_info = BookInfo.new(
  "創りながら学ぶRuby",
  "久保秋真",
  Date.new(2019, 4, 21),
  "Ruby"
)
puts book_info.toFormattedString
puts book_info.toFormattedString("/")