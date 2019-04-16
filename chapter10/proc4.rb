# Proc.newとラムダの違い
add_proc = Proc.new { |a, b| a + b }
p add_proc.call(10, 20)
p add_proc.call(1, 2, 3)
p add_proc.lambda? # Proc.newかラムダか判断するメソッド

add_lamda = -> (a, b) { a + b } # ラムダはProc.newよりも引数のチェックが厳密になる
p add_lamda.class
p add_lamda.lambda?
p add_lamda.call(20, 190)
p add_lamda.call(10)