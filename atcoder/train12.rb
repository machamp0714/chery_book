# frozen_string_literal: true

M, N = gets.chomp.split.map(&:to_i)
plus_output = []
minus_output = []
numbers = (0..99).to_a

def create_plus_question(a, b)
  "#{a} + #{b} ="
end

def create_minus_question(a, b)
  if a > b
    "#{a} - #{b} ="
  else
    "#{b} - #{a} ="
  end
end

def dup(output, question)
  output.count { |e| e == question }
end

def maximum_validates(a, b)
  a + b > 99
end

while plus_output.length < M
  a = numbers.sample
  b = numbers.sample

  next if maximum_validates(a, b)

  question = create_plus_question(a, b)

  next if dup(plus_output, question).positive?

  plus_output << question
end

while minus_output.length < N
  a = numbers.sample
  b = numbers.sample

  question = create_minus_question(a, b)
  next if dup(minus_output, question).positive?

  minus_output << question
end

output = plus_output + minus_output

p output
