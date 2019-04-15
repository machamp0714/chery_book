# 9.6.7 begin/endを省略できるケース
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
  puts "#{e.class}: #{e.message}"
end

fizz_buzz(3)
fizz_buzz(nil)