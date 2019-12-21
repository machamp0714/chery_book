class ExtractWord
  def self.execute(file_path)
    self.new.execute(file_path)
  end

  def execute(file_path)
    text = File.read(file_path)
    words = count_words(text)
  end

  private

  def count_words(text)
    word_char = "[\w'\/-]"
    compound_words = /[A-Z]#{word_char}*(?: of| [A-Z]#{word_char}*)+/

    words = /#{word_char}+/
    regex = Regexp.union(compound_words, words)

    text.scan(regex).tap{|s| p s}.each_with_object(Hash.new(0)) do |word, count_table|
      count_table[word] += 1
    end
  end
end

file_path = File.expand_path("./resource/sample.txt")
ExtractWord.execute(file_path)
