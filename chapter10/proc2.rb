# Procオブジェクトをブロックの代わりに渡す
def greeting(&block)
  puts 'おはよう'
  text = block.call('こんにちは')
  puts text
  puts 'こんばんは'
end

repeat_proc = Proc.new { |text| text * 2 }
greeting(&repeat_proc) # Procオブジェクトを引数として渡す場合は、引数の手前に&をつける