require 'pstore'

juice = 'orange juice'
fruits = %w(apple melon chery banana grape)

db = PStore.new('fruitdb')

# PStoreにデータを書き込む
db.transaction do
  db[:drink] = juice
  db[:fruits] = fruits
end

# PStoreからデータを読み込んで表示する
# transactionメソッドにtrueを渡すと読み込み専用モードになる
db.transaction(true) do
  puts "drink: #{db[:drink]}"
  puts "fruits: #{db[:fruits]}"
end