add_proc = Proc.new { |a, b| a.to_i + b.to_i }
p add_proc.call(10)
p add_proc.call(10, 20, 30)

add_lambda = -> (a, b) { a.to_i + b.to_i }
p add_lambda.call(10, 20)
p add_lambda.class

# Proc.newでProcオブジェクトを作る場合と違い、
# lambdaでProcオブジェクトを作ると引数の個数を厳密にチェックする。

p add_proc.lambda?
p add_lambda.lambda?