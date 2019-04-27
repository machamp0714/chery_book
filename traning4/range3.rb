# case文で使う
# def charge(age)
#   case age
#   when (0..6).include?(age)
#     0
#   when (6..12).include?(age)
#     300
#   when (12..18).include?(age)
#     600
#   else
#     1000
#   end
# end

def charge(age)
  case age
  when (0..6)
    0
  when (7..12)
    300
  when (13..18)
    600
  else
    1000
  end
end
p charge(4)
p charge(12)
p charge(15)
p charge(24)