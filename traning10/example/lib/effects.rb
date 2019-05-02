module Effects
  def self.reverse
    -> (words) { words.split(' ').map(&:reverse).join(' ') }
  end

  def self.echo(rate)
    -> (words) { words.chars.map { |w| w == ' ' ? w : w * rate }.join }
  end

  def self.loud(count)
    -> (words) { words.split(' ').map { |word| word.upcase << "!" * count }.join(' ') }
  end
end