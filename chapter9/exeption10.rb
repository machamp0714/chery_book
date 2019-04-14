# ensureの代わりにブロックを使う
File.open('hello.txt', 'w') do |file| # 例外は発生するものの、openメソッドによってクローズ処理自体は必ず行われる
  file << 'Hello'
  1 / 0
end