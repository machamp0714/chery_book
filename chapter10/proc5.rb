# 10.5.1 Procオブジェクトを実行する様々な方法
add_proc = Proc.new { |a, b| a + b }

p add_proc.call(10, 20)
p add_proc.yield(10, 20)
p add_proc.(10,20)
p add_proc[10,20]
p add_proc === [10,20]

def judge(age)
  adult = Proc.new { |n| n > 20 }
  child = Proc.new { |n| n < 20 }

  case age # when節のオブジェクト　=== case節のオブジェクトの結果 
  when adult
    puts '大人です'
  when child
    puts '子供です'
  end
end

judge(25)
judge(13)