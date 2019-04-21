# Fileクラスのopenメソッドを使うときは、オープンしたファイルの処理をブロックとして渡すことができる
# また、ブロックを抜けるとときはclose処理も自動で実行してくれる
File.open('sample.txt', 'r:UTF-8') do |file|
  file.each do |line|
    puts line
  end
end