# 9.2.6 recue節を書くときは例外の継承関係に注意する

begin
  Foo.new
rescue NoMethodError
  puts 'メソッドが存在しません。'
rescue NameError
  puts '名前のエラーです。'
rescue StandardError
  puts 'その他のエラー'
end