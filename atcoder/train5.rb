# frozen_string_literal: true

# 複数形への変換
count = gets.chomp.to_i
words = []
count.times do
  words << gets.chomp
end

result = words.map! do |word|
  if word[-2, 2].match?(/(sh|ch)/)
    word.concat("es")
  elsif word[-1].match?(/[sox]/)
    word.concat("es")
  elsif word[-2, 2] == "fe"
    word.delete_suffix("fe").concat("ves")
  elsif word[-1] == "f"
    word.delete_suffix("f").concat("ves")
  elsif word[-1] == "y" && word[-2] !~ /[aiueo]/
    word.delete_suffix("y").concat("ies")
  else
    word.concat("s")
  end
end

result.each { |word| puts word }
