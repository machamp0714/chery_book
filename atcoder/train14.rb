input = gets.chomp.split
count = input[0].to_i
T = input[1]
S = gets.chomp

s = "a"
result = T.chars.each_with_object({}) do |c, hash|
  hash.merge!(s => c)
  s.succ!
end

convert = result.invert

count.times do
  S.gsub!(/[a-z]/, convert)
end

puts S
