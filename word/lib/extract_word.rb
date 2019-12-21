class ExtractWord
  TEXT_PATH = File.expand_path("./resource/sample.txt")

  def self.execute(file_path = TEXT_PATH)
    new.execute(file_path)
  end

  def execute(file_path)
    text = File.read(file_path)
    words = divide_into_words(text)
    word_count_table = word_count_table(words)
    words_count = words.count
    output_results(word_count_table, words_count)
  end

  private

  def divide_into_words(text)
    text.scan(/\w+/)
  end

  def word_count_table(words)
    words.each_with_object(Hash.new(0)) { |word, word_table|
      word_table[word] += 1
    }
  end

  def output_results(table, count)
    puts "単語数 :#{count}"
    puts "英単語-------------------------------------------"
    output_words(table)
  end

  def output_words(table)
    sorted_table = table.sort_by { |_, count| -count }.to_h
    sorted_table.each do |word, count|
      puts "%3d %s" % [count, word]
    end
  end
end

ExtractWord.execute
