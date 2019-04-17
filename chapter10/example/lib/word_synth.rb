require './lib/effects'

class WordSynth
  extend Effects
  
  def initialize
    @effects = []
  end

  def add_effect(effect)
    @effects << effect
  end

  def play(orizinal_words)
    @effects.inject(orizinal_words) do |words, effect|
      effect.call(words)
    end
  end
end

synth = WordSynth.new
# synth.add_effect(Effects.reverse)
# p synth.play("Ruby is fun!")
# p synth.play('abc')
# synth.add_effect(Effects.loud(2))
p synth.play("Ruby is fun")