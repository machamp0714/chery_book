# テキストの入力を受け付ける
# 正規表現のパターンを受け付ける
# 正しいパターンか？　エラーメッセー字を表示
# マッチした文字列を取得する
# マッチした文字列が存在するか？　マッチしなかったと言う文字列を表示
# マッチした文字列を表示

print 'Text?:' # printメソッドを使うと改行しない
# getsメソッドを呼ぶと、プログラムはユーザーの入力を待つ
# 改行文字が含まれてしまうので、chompメソッドを使って削除する
text = gets.chomp
begin
  print 'Pattern?:'
  pattern = gets.chomp
  regexp = Regexp.new(pattern)
rescue RegexpError => e
  puts "invalid pattern: #{e.message}"
  retry
end
matches = text.scan(regexp)
if matches.size > 0
  puts "Matched: #{matches.join('.')}"
else
  puts "Nothing matched."
end