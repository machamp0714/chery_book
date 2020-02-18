# frozen_string_literal: true

M, N = gets.chomp.split.map(&:to_i)

def create_random_number
  numbers = (0..99).to_a
  [numbers.sample, numbers.sample]
end

def create_plus_question
  a, b = create_random_number
  if a + b <= 99
    "#{a} + #{b} ="
  else
    create_plus_question
  end
end

def create_minus_question
  a, b = create_random_number

  if a > b
    "#{a} - #{b} ="
  else
    "#{b} - #{a} ="
  end
end

def dup?(question, questions)
  questions.count { |e| e == question }.positive?
end

def create_questions(m, n)
  plus_questions = []
  minus_questions = []

  while plus_questions.length < m
    question = create_plus_question
    plus_questions << question unless dup?(question, plus_questions)
  end

  while minus_questions.length < n
    question = create_minus_question
    minus_questions << question unless dup?(question, minus_questions)
  end

  plus_questions + minus_questions
end

questions = create_questions(M, N)
questions.shuffle.each { |question| puts question }
