# 様々な繰り返し処理
## 4.9.1 timesメソッド
sum = 0
5.times { |n| sum += n } # 配列を使わず、単純にn回処理を繰り返したい、という場合はIntegerクラスのtimesメソッドが便利
p sum

# 4.9.2 uptoとdowntoメソッド
a = []
10.upto(14) { |n| a << n } # nからmまで数値を1ずつ増やしながら処理をしたい時に用いる
p a

d = []
14.downto(10) { |n| d << n }
p d

## 4.9.3 stepメソッド
a = []
1.step(10, 2) { |n| a << n } # nからmまでxずつ増やしながら処理を行いたいときはNumericクラスのstepメソッド
p a

d = []
10.step(1, -2) { |n| d << n }
p d

# 4.9.4 while文とuntil文
a = []
while a.size < 5
    a << 1
end
b = []
b << 1 while b.size < 5 
p b

begin            # どんな条件でも最低1回は実行したい場合はbegin...end
    a << 1
end while false
p a

a = [100, 80, 60, 40, 20]
until a.size <= 3
    a.delete_at(-1)
end
p a

## for文
numbers = [1, 2, 3, 4]
total = 0
for n in numbers
    total += n
end 
p total

# 4.9.6 loopメソッド
numbers = [1, 2, 3, 4, 5]
loop do
    n = numbers.sample
    puts n
    break if n == 5
end