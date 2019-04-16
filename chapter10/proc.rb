# Procオブジェクト
# Procクラスはブロックをオブジェクト化するためのクラスです。

# hello_proc = Proc.new do # Proc.newにブロックを渡す
#   'Hello!'
# end

hello_proc = Proc.new { 'Hello!' }
p hello_proc.call # Procオブジェクトはただ存在しているだけでは全く実行されない。callメソッドを使う

# add_proc = Proc.new { |a, b| a + b }
add_proc = proc { |a, b| a + b } # Kernelモジュールのprocメソッドを使うことができる
p add_proc.call(10, 20)
