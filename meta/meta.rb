class Array
  def replace(orizinal, replacement) # モンキーパッチ
    self.map { |e| e == orizinal ? replacement : e }
  end
end

array = %w(one two one three)
p array.replace('one', 'zero')