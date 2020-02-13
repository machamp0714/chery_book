# frozen_string_literal: true

class KaraokeMachine
  attr_reader :melody

  MELODY = %w[C C# D D# E F F# G G# A A# B].freeze

  def initialize(melody)
    @melody = melody
  end

  def transpose(amount)
    regex = /[A-G]#?/
    convert_table = melody.scan(regex).each_with_object({}) do |key, table|
      index = MELODY.index(key)
      table[key] = MELODY.rotate(amount).slice(index)
    end
    melody.gsub(regex, convert_table)
  end
end
