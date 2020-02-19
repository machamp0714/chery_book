require "bigdecimal"

height, weight = gets.chomp.split.map(&:to_f)

bmi = weight / ((height * 0.01)**2)
bmi = BigDecimal(bmi.to_s).floor(1).to_f

judge = if bmi < 18.5
          "低体重"
        elsif bmi >= 18.5 && bmi < 25
          "普通体重"
        elsif bmi >= 25 && bmi < 30
          "肥満（１度）"
        elsif bmi >= 30 && bmi < 35
          "肥満（２度）"
        elsif bmi >= 35 && bmi < 40
          "肥満（３度）"
        else
          "肥満（４度）"
        end

puts "BMI: #{bmi}"
puts "判定: #{judge}"
