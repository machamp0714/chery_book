# 例外処理のベストプラクティス
require 'date'
def convert_heisei_to_date(heisei_text)
  m = heisei_text.match(/平成(?<jp_year>\d+)年(?<month>\d+)月(?<day>\d+)日/)
  year = m[:jp_year].to_i
  month = m[:month].to_i
  day = m[:day].to_i
  if Date.valid_date?(year, month, day) # rescueを安易に使わない
    Date.new(year, month, day)
  end
end

birthday = convert_heisei_to_date("平成3年7月14日")
p birthday

