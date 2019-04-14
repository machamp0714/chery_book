# 9.2.4 例外オブジェクトから情報を取得する
begin
  1 / 0
rescue => e
  puts "エラークラス: #{e.class}"
  puts "エラーメッセージ: #{e.message}"
  puts "バックトレース-----"
  puts e.backtrace
  puts "-----"
end