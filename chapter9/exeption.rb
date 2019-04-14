# 9.2.2 例外を補足して処理を続行する場合
puts 'Start'
module Greeter
  def hello
    'hello'
  end
end

begin # 例外処理
  greeter = Greeter.new
rescue
  puts '例外が発生したが、このまま続行する'
end

puts 'END'
