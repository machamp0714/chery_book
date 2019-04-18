# 10.5.2 &,to_procメソッド
# procオブジェクトをブロックとして渡したい場合
reverse_proc = Proc.new { |s| s.reverse }
p ['Java', 'Ruby', 'Python'].map(&reverse_proc)
# &の役割は厳密には右辺のオブジェクトに対してto_procメソッドを呼び出し、
# その戻り値として得られたProcオブジェクトを、ブロックを利用するメソッドに与える。

# Procオブジェクト以外でto_procメソッドを持つオブジェクトが存在する。
split_proc = :split.to_proc
p split_proc

# 引数を１つ渡して実行すると、１つ目の引数をレシーバにし、そのレシーバに対して元のシンボルと同じ名前のメソッドを呼びだす。
p split_proc.call('a-b-c-d e')

p split_proc.call('a-b-c-d e', '-')

p ['Java', 'Ruby', 'Python'].map(&:upcase)
# 1. :upcase に対してto_procメソッドを呼び出す
# 2. mapメソッドにブロックとして渡される
# 3. 配列の各要素がupcaseメソッドの第一引数、つまりupcaseメソッドのレシーバとなる