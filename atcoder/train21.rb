data_count = gets.chomp.to_i
input_data = []
data_count.times do
  input_data << gets.chomp.split
end

point_list = input_data.each_with_object([]) do |(date, price), result|
  day = date.split("/").last
  price = price.to_i

  result << if day == "01"
              price * 0.05
            elsif day.include?("3")
              price * 0.02
            elsif day.include?("5")
              price * 0.03
            else
              price * 0.01
            end
end

sum = point_list.map(&:floor).reduce(:+)
puts "#{sum}ポイント"
