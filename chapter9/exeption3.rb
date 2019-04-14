# 9.2.5 クラスを指定して補足する例外を指定する
begin
  'abc'.foo
rescue ZeroDivisionError, NoMethodError => e # 例外オブジェクトのクラスが一致した場合のみ、例外を補足する
  puts '0で除算したかメソッドが存在しません。'
# rescue NoMethodError
#   puts 'メソッドが存在しません' # 複数のrescue節を書くこともできる
  puts "#{e.class}"
  puts "#{e.message}"
end