class Loan
  def initialize(book)
    @book = book
    # @time = Time.now 実行するたびに違う値を返すのでどうテストすれば良いのか分からない!!!
    @time = Loan.time_class
  end

  def to_s
    "#{@book.capitalize} loaned on #{@time}"
  end

  def self.time_class
    @time_class || Time.now
  end
end

class FakeTime
  def self.now
    'Mon Apr 06 12:15:50'
  end
end