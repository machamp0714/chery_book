# Procオブジェクトを普通の引数として渡す

def greeting(arrange_proc)
  puts 'おはよう'
  text = arrange_proc.call('こんにちは')
  puts text
  puts 'こんばんは'
end

repeat_proc = Proc.new { |text| text * 2 }
greeting(repeat_proc) # Procオブジェクトを普通の引数としてメソッドに渡す

def greeting(proc1, proc2, proc3)
  puts proc1.call('おはよう')
  puts proc2.call('こんにちは')
  puts proc3.call('こんばんは')
end

proc1 = Proc.new { |text| text.chars.shuffle.join }
proc2 = Proc.new { |text| text * 2 }
proc3 = Proc.new { |text| "#{text}" }

greeting(proc1, proc2, proc3) # メソッドが受け取れるブロックの数は最大１つだが、Procオブジェクトはただのオブジェクトなので何個でもおk