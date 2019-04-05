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