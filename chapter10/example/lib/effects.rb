module Effects
  def self.reverse
    -> (words) do
      # words.map { |word| word.reverse }
      words.split(' ').map(&:reverse).join(' ') 
    end
  end

  def self.echo(rate)
    -> (words) do
      words.chars.map { |c| c == '' ? c : c * rate }.join
    end
  end

  def self.loud(level)
    -> (words) do
      words.split(' ').map { |word| word.upcase.concat('!' * level) }.join(' ')
    end
  end
end