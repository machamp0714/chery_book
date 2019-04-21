fruits = %w(apple melon chery banana grape)
fname = 'sample4.txt'
File.open(fname, 'w:UTF-8') do |file|
  fruits.each do |fruit|
    file.puts fruit
  end
end

File.open(fname, 'r:UTF-8') do |file|
  file.each do |line|
    puts line
  end
end
# ファイルを削除する。unlinkはdeleteのaliasメソッド
File.delete(fname)
begin
  File.open(fname, 'r:UTF-8')
rescue
  puts 'ファイルが存在しません。'
end