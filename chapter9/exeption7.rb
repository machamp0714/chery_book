# 意図的に例外を発生させる　
def currency_of(country)
  case country
  when :japan
    puts 'yen'
  when :us
    puts 'dollar'
  when :india
    puts :rupee
  else
    # raise ArgumentError, "無効な国籍です。 #{country}" raiseメソッドを使って意図的に例外を発生させる事ができる
    raise ArgumentError.new("無効な国籍です。 #{country}") # raiseメソッドには例外クラスのインスタンスを引数に渡すこともできる
  end
end
currency_of(:japan)
currency_of(:italy)