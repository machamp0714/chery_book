module DeepFreezable
  def deep_freeze(array_or_hash)
    if array_or_hash.is_a?(Array)
      array_or_hash.each do |element|
        element.freeze
      end
      array_or_hash.freeze
    elsif array_or_hash.is_a?(Hash)
      array_or_hash.each do |key, value|
        key.freeze
        value.freeze
      end
      array_or_hash.freeze
    end
  end
end