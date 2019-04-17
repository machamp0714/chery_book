# 9.6.9 独自の例外クラスを定義する
# 例外クラスを定義する場合は特別な理由がない限り、StandardErrorクラスか、そのサブクラスを継承するようにする
class NoCountryError < StandardError
  attr_reader :country

  def initialize(message, country)
    @country = country
    super("#{message} #{country}")
  end
end

def currency_of(country)
  case country
  when :japan
    p 'yen'
  when :us
    p 'dollar'
  when :india
    p 'rupee'
  else
    raise NoCountryError.new('無効な国名', country)
  end
end

begin
  currency_of("italy")
rescue NoCountryError => e
  puts e.message
  puts e.country
end