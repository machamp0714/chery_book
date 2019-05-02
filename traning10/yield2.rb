# def greeting(&block) # blockを明示的に引数として受け取る
#   puts 'おはよう'
#   text = block.call('こんにちは') # 受け取ったblockはcallメソッドで実行する
#   puts text
#   puts 'こんばんは'
# end

# greeting { |text| text * 2 }

# def greeting_ja(&block)
#   texts = %w(おはよう こんにちは こんばんは)
#   greeting_common(texts, &block)
# end

# def greeting_en(&block)
#   texts = ['good morning', 'hello', 'good evening']
#   greeting_common(texts, &block)
# end

# def greeting_common(texts, &block)
#   puts texts[0]
#   puts block.call(texts[1])
#   puts texts[2]
# end

# greeting_ja { |text| text * 2 }
# greeting_en(&:upcase)

def greeting(&block)
  puts 'おはよう'
  text =
    if block.arity == 1
      yield 'こんにちは'
    elsif block.arity == 2
      yield 'こんに', 'ちは'
    end
  puts text
  puts 'こんばんは'
end

greeting do |text1, text2|
  text1 * 2 + text2
end
