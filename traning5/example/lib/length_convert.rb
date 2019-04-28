UNITS = { m: 1, in: 39.37, ft: 3.28 }

def length_convert(length, from: :m, to: :m)
  (length / UNITS[from] * UNITS[to]).round(2)
end

p length_convert(1, from: :in, to: :ft)
