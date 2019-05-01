text = '私の誕生日は1977年7月17日です。'
# m = /(?<year>\d+)年(?<month>\d+)月(?<day>\d+)日/.match(text)
# p m[:year]
# p m[:month]
# p m[:day]

if /(?<year>\d+)年(?<month>\d+)月(?<day>\d+)日/ =~ text
  puts "#{year}年#{month}月#{day}日" # キャプチャの名前がそのままローカル変数に割り当てられる
end

# ただし、正規表現を一旦変数に入れたりすると使えない