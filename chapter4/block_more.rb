# ブロックについてもっと詳しく
## 添え字付きの繰り返し処理
fruites = %w(apple orrange melon)
fruites.each_with_index { |fruite, i| puts "#{i}: #{fruite}" } 
p fruites.map.with_index { |fruite, i| "#{i}: #{fruite}" }
p fruites.delete_if.with_index { |fruite, i| fruite.include?('a') &&  i.odd? }

## 4.8.3 添え字を０以外の数値から開始させる
fruites.each.with_index(1) { |fruite, i| puts "#{i}: #{fruite}" }