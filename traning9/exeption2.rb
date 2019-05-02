def currency_of(country)
  case country
  when :japan
    puts "yen"
  when :us
    puts "dollar"
  when :india
    puts "rupee"
  else
    # raise ArgumentError, "無効な国名です。 #{country}"
    raise ArgumentError.new("無効な国名です。 #{country}")
  end
end

currency_of(:japan)
currency_of(:italy)