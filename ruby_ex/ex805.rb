require 'date'

# 表示したい臓書データを作成する
publish_date = Date.new(2019, 4, 20)
mon_name = Date::MONTHNAMES[publish_date.mon]

# 蔵書データを表示する
puts "出版年: " + publish_date.year.to_s
puts "出版月: " + mon_name