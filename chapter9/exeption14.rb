# 9.6.8 rescueした例外を再度発生させる
# 例外が発生したら、プログラム自体は以上終了させるものの、その情報はログに残したい場合に使える
def fizz_buzz(n)
  if n % 15 == 0
    puts 'FizzBuzz'
  elsif n % 3 == 0
    puts 'Fizz'
  elsif n % 5 == 0
    puts 'Buzz'
  else
    n.to_s
  end
rescue => e
  puts "[LOG] エラーが発生しました: #{e.class} #{e.message}"
  raise
end

fizz_buzz(nil)