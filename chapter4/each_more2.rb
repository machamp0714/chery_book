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

## 4.10.3 繰り返し処理で使うbreakとreturnの違い
def calc_with_break
    numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    target = nil
    numbers.shuffle.each do |n|
        target = n
        return if n.even? # breakをreturnにすると引数を指定していないので、nilが戻り値となる 
    end
    target * 10
end
p calc_with_break # returnの役割はあくまでメソッドの脱出である

## 4.10.4 next
numbers_a = [1, 2, 3, 4, 5]
numbers_a.each do |n|
    next if n.even? # 偶数であれば処理を中断して次の繰り返し処理に進む
    puts n
end