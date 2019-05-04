# 無限ループが発生する
# 扱えない呼び出しを受け取った場合は、BasicObject#method_missingを呼び出す
# class Roulette
#   def method_missing(name, *args)
#     person = name.to_s.capitalize
#     3.times do
#       number = rand(10) + 1
#       puts "#{number}..."
#     end
#     "#{person} got a #{number}"
#   end
# end

class Roulette
  def method_missing(name, *args)
    person = name.to_s.capitalize
    super unless %w(Bob Frank Carol).include?(person)
    number = 0
    3.times do
      number = rand(10) + 1
      puts "#{number}..."
    end
    "#{person} got a #{number}"
  end
end
number_of = Roulette.new
puts number_of.bob
puts number_of.frank