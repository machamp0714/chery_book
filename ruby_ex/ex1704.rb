fruits = %w(apple melon banana chery grape)

# file = File.open('sample2.txt', 'w:UTF-8')
# fruits.each do |fruit|
#   file.puts fruit
# end
# file.close

# file = File.open('sample2.txt', 'r:UTF-8')
# puts file.read
# file.close

file = File.open('sample3.txt', "w+:UTF-8")
fruits.each do |fruit|
  file.puts fruit
end
puts file.read
file.close