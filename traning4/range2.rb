# if文で使う
# def liquid?(temperture)
#   0 <= temperture && temperture < 100
# end
# p liquid?(0)
# p liquid?(50)
# p liquid?(100)
# (a..b) => bを含む
def liquid?(temperture)
  (0...100).include?(temperture)
end

p liquid?(50)
p liquid?(100)