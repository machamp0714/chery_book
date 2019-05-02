require 'effects'

class WordSynth
  def initialize
    @effects = []
  end

  def add_effect(effect)
    @effects << effect
  end

  def play(orizinal_words)
    if @effects.size > 0
      @effects.inject(orizinal_words) { |words, effect| effect.call(words)  }
    else
      orizinal_words
    end
  end
end