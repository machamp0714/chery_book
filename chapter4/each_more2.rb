# 繰り返し処理用の制御構造
## 4.10.1 break
numbers = [1, 2, 3, 4, 5].shuffle
numbers.each do |n|
    puts n
    # 5が出たら繰り返しを脱出
    break if n == 5
end

i = 0
while i < numbers.size
    n = numbers[i]
    puts n
    break if n == 5
    i += 1 
end

ret =
    while true
        break 123 # breakに引数を渡すと、whileやfor文の戻り値になる。
    end
p ret

fruits = %w(apple melon orange)
numbers = [1, 2, 3]
fruits.each do |fruit|
    numbers.shuffle.each do |n|
        puts "#{fruit}, #{n}"
        break if n == 3
    end
end

## 4.10.2 throwとcatchを使った大域脱出
catch :done do # タグには通常シンボルを使う
    fruits.shuffle.each do |fruit|
        numbers.shuffle.each do |n|
            puts "#{fruit}, #{n}"
            if fruit == 'orange' && n == 3
                throw :done
            end
        end
    end
end
