module DeepFreezable
  def deep_freeze(array_or_hash)
    # if array_or_hash.is_a?(Array) 
    #   array_or_hash.map(&:freeze)
    #   array_or_hash.freeze
    # else
    #   array_or_hash.freeze
    #   array_or_hash.each do |key, value|
    #     key.freeze
    #     value.freeze
    #   end
    #   return array_or_hash
    # end
    case array_or_hash # when節のオブジェクト === array_or_hashを評価している
    when Array
      array_or_hash.map(&:freeze)
      array_or_hash.freeze
    when Hash
      array_or_hash.each do |key, value| 
        key.freeze
        value.freeze
      end
      array_or_hash.freeze
    end
  end
end

class Team
  extend DeepFreezable

  COUNTRIES = deep_freeze(%w(Japan US India))
end

class Bank
  extend DeepFreezable

  CURRENCIES = deep_freeze({ Japan: 'yen', US: 'dollar', India: 'rupee' })
end