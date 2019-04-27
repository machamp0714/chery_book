numbers = [1, 2, 3, 4]
# sum = 0
# numbers.each do |n|
#   sum += n
# end
# puts sum

# injectメソッドで置き換える
p numbers.inject(0) { |result, num| result += num }

# &とシンボル
lang = %w(Ruby Python Java)
# puts lang.map { |l| l.upcase }.inspect
p lang.map(&:upcase)
# p [1, 2, 3, 4, 5, 6].select { |n| n.odd? }
p [1, 2, 3, 4, 5, 6].select(&:odd?)
