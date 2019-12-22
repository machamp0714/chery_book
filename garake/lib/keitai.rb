class Keitai
  def self.message(numbers)
    new.message(numbers)
  end

  def message(numbers)
    input = numbers.scan(/\d+?0/).map { |s| s.delete!("0") }
    converted_input = input.map do |num|
      count = num.length
      convert_number(num.chr, count)
    end

    converted_input.join
  end

  private

  def convert_number(num, count)
    outputs = convert_table[num]
    begin
      outputs[count - outputs.size - 1]
    rescue NoMethodError
      ""
    end
  end

  def convert_table
    {
      "1" => [".", ",", "!", "?", " "],
      "2" => %w[a b c],
      "3" => %w[d e f],
      "4" => %w[g h i],
      "5" => %w[j k l],
      "6" => %w[m n o],
      "7" => %w[p q r s],
      "8" => %w[t u v],
      "9" => %w[w x y z]
    }
  end
end

Keitai.message("0")
