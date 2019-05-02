module StringExtensions
  refine String do # Refinementsはモンキーパッチと似ているが、グローバルではない
    def reverse
      "esrever"
    end
  end
end

module StringStuff
  using StringExtensions
  p "my_string".reverse
end

p "my_string".reverse