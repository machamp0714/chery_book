# frozen_string_literal: true

# ブロックを引数として明示的に受け取る
def greeting(&block) # blockを引数として受け取る時は、引数に&を付ける
  puts 'おはよう'
  if block_given?
    text = block.call('こんにちは')
    puts text
  end
  puts 'こんばんは'
end

greeting do |text|
  text * 2
end

def greeting_ja(&block)
  texts = %w[おはよう こんにちは こんばんは]

  greeting_common(texts, &block)
end

def greeting_en(&block)
  texts = ['good morning', 'hello', 'good evening']

  greeting_common(texts, &block)
end

def greeting_common(texts, &block)
  puts texts[0]
  text = block.call(texts[1])
  puts text
  puts texts[2]
end

greeting_ja do |text|
  text * 2
end

# Procオブジェクト
def greeting_proc(&block)
  puts 'good moring'
  if block_given?
    text = block.call('hello')
    puts text
  end
  puts 'good evening'
end

repeat_proc = proc { |text| text * 2 }
greeting_proc(&repeat_proc)

# Procとラムダ
add_proc = proc { |a, b| a.to_i + b.to_i }
puts add_proc.call(10, 20)
puts add_proc.call(10)

add_lambda = ->(a, b) { a + b }
puts add_lambda.call(100, 200)
# puts add_lambda.call(100) # ラムダはProcより引数のチェックが厳密で、これはエラーが起きる
puts add_lambda.lambda?

# Procオブジェクトを実行する様々な方法

puts add_proc.call(10, 20)
puts add_proc.yield(10, 20)
puts add_proc.call(10, 20)
puts add_proc[10, 20]
puts add_proc === [10, 20]

# &とto_procメソッド

reverse_proc = proc { |s| s.reverse }

puts %w[apple melon chery].map(&reverse_proc)

split_proc = :split.to_proc

p split_proc.call("a b c")

p %w(apple melon chery).map(&:upcase)

# Procオブジェクトとクロージャ
def generate_proc(array)
  counter = 0
  proc do
    counter += 10
    array << counter
  end
end

values = []
array_proc = generate_proc(values)
array_proc.call
p values
array_proc.call
p values
array_proc.call
p values
