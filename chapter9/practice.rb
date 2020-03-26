module DeepFreeze
  def deep_freeze(args)
    case args
    when Array
      args.each(&:freeze)
    when Hash
      args.each do |key, value|
        key.freeze
        value.freeze
      end
    else
      raise "引数はArrayまたはHashのみでなければいけません。"
    end
    args.freeze
  end
end

class Team
  extend DeepFreeze

  COUNTRIES = deep_freeze(%w[Japan Chaina Canada])
end

p Team::COUNTRIES.frozen?
p Team::COUNTRIES.all?(&:frozen?)
