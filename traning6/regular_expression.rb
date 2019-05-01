text = '私の誕生日は1977年7月17日です。'
m = /\d+年\d+月\d+日/.match(text) # MatchDataオブジェクトを返す aマッチしない場合はnilを返す
p m.class

# よく使われるイディオム
# 条件分岐で変数に代入
if capcher = /(\d+)年(\d+)月(\d+)日/.match(text)
  p capcher[0]
else
  p "一致する文章はありませんでした。"
end