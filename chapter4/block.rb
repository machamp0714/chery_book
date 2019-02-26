#numbers = [1, 2, 3, 4, 5]
# new_numbers = []
# numbers.each { |n| new_numbers << n * 10 }
# puts new_numbers

# numbers = [1, 2, 3, 4, 5, 6]
# new_numbers = numbers.map { |n| n * 10 }
# puts new_numbers

numbers = [1, 2, 3, 4, 5, 6]
even_numbers = numbers.select { |n| n.even? }
puts even_numbers

reject_three_numbers = numbers.reject {|n| n % 3 == 0 }
puts  reject_three_numbers

odd_number = numbers.find { |n| n.odd? }
puts odd_number

sum = numbers.inject(0) {|result, n| result + n }
puts sum