line_num = 0

file = File.open('sample.txt', 'r:UTF-8')

# ファイルの終わりまで、1行ずつ読みこむ
# getsメソッドは、ファイルの終わりに達するとnilを返す
# while (line = file.gets)
#   line_num += 1
#   puts "#{line_num}: #{line}"
# end
# Fileクラスのeachメソッドを使う場合
file.each do |line|
  puts line
end

file.close