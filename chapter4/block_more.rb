# ブロックについてもっと詳しく
## 添え字付きの繰り返し処理
fruites = %w(apple orrange melon)
fruites.each_with_index { |fruite, i| puts "#{i}: #{fruite}" } 
p fruites.map.with_index { |fruite, i| "#{i}: #{fruite}" }
p fruites.delete_if.with_index { |fruite, i| fruite.include?('a') &&  i.odd? }

## 4.8.3 添え字を０以外の数値から開始させる
fruites.each.with_index(1) { |fruite, i| puts "#{i}: #{fruite}" } # each_with_indexメソッドには引数を渡せない

## 4.8.4 配列がブロック引数に渡される場合
dimensions = [
    [10, 20],
    [30, 40],
    [50, 60],
]
areas = []
dimensions.each do |dimension|
    length = dimension[0]
    width = dimension[1]
    areas << length * width
end
p areas

dimensions.each do |length, width|
    areas << length * width
end
p areas

dimensions.each_with_index do |length, width, i|
    puts "length: #{length}, width: #{width}, i: #{i}"
end

dimensions.each_with_index do |dimension, i|
    length = dimension[0]
    width = dimension[1]
    puts "length: #{length}, width: #{width}, i: #{i}"
end

dimensions.each_with_index do |(length, width), i|
    puts "length: #{length}, width: #{width}, i: #{i}"
end

## 4.8.5 ブロックローカル変数
numbers = [1, 2, 3, 4]
sum = 0
numbers.each do |n; sum| # ブロック内でのみ有効なローカル変数を宣言できる
    sum = 10
    sum += n
    p sum
end
p sum