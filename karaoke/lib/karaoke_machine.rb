# frozen_string_literal: true

class KaraokeMachine
  attr_reader :melody

  def initialize(melody)
    @melody = melody
  end

  def transpose(amount)
    key = %w[C C# D D# E F F# G G# A A# B]
    result = []
    melody.each_char do |c|
      result << if c == ' '
                  ' '
                elsif c == '|'
                  '|'
                elsif key.index(c) + amount > key.length - 1
                  key[-(key.length - key.index(c) - amount)]
                else
                  key[key.index(c) + amount]
                end
    end
    result.join
  end
end

machine = KaraokeMachine.new('C D E F |E D C   |E F G A |G F E   |C   C   |C   C   |CCDDEEFF|E D C   ')

p machine.transpose(2)
