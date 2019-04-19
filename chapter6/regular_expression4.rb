# 6.3.2 正規表現のキャプチャを利用する
text = '私の誕生日は1977年7月17日です。'
m = /(\d+)年(\d+)月(\d+)日/.match(text) # 文字列が正規表現にマッチするとMatchDataオブジェクトが返る
p m
p m[0] # MatchDataオブジェクトは[]を使って正規表現の処理結果を配列と同じ様な方法で取得できます。
p m[1]
p m[2]
p m[3]
