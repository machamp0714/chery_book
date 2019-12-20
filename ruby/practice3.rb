# 21. nilが返される場合の考慮
array = %w[foo bar baz]
array.find { |w| w.start_with?("b") }.capitalize
array.find { |w| w.start_with?("c") }&.capitalize # メソッド連鎖にnil対策を施す

# 22. ハッシュ がnilを返さないようにする
# {
#   "a" => 3,
#   "b" => 2,
#   "c" => 4
# }
hash = { "a" => 1, "A" => 2, "B" => 2, "c" => 3, "C" => 1 }
# Hashは存在しないkeyを指定するとnilを返す
# nil以外を返したい場合、Hash.newに返したい値を引数として渡す
hash.each_with_object(Hash.new(0)) { |(k, v), h| h[k.downcase] += v }

# 25. 条件分岐の順序
def fizzbuzz(n)　# returnにより短絡評価する
  return "FizzBuzz" if n % 15 == 0
  return "Fizz" if n % 3 == 0
  return "Buzz" if n % 5 == 0
  n
end

# 26. 短絡評価
p (1..10).to_a.repeated_combination(3).count { |x, y, z| x + y == z }
p (1..10).to_a.repeated_combination(3).one? { |x, y, z| x**2 + y**2 == z**2 }
p (1..10).to_a.repeated_combination(3).any? { |x, y, z| x**3 + y**3 == z**3 }

primes = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97]
p 4.step(100, 2).all? { |x| primes.any? { |y| primes.include?(x - y) } }
