def liquid?(temperature)
    (1...100).include?(temperature)
end
puts liquid?(50)
puts liquid?(100)

def charge(age)
    case age
    when 0..5
        0
    when 6..12
        300
    when 13..18
        60
    else
        1000
    end
end

puts charge(5)
puts charge(16)
puts charge(81)