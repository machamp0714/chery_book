module Effects

  def self.reverse # 減点2
    ->(word) { word.split(' ').map(&:reverse).join(' ') }
  end

  def self.echo(rate)
    ->(word) { word.chars.map { |w| w == ' ' ? w : w * rate }.join('') }
  end

  def self.loud(count)
    ->(word) { word.split(' ').map { |w| w.upcase.concat('!' * count) }.join(' ') }
  end

end

class WordSynth

  include Effects

  def initialize
    @effects = []
  end

  def play(words) #減点1
    @effects.inject(words) do |result, effect|
      effect.call(result)
    end
  end

  def add_effect(effect)
    @effects << effect
  end
end