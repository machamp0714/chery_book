str = "Twinkle, twinkle, liitle star,
How I wonder what you are.
Up above the world so high,
Like a diamond in the sky.
Twinkle, twinkle, liitle star,
How I wonder what you are.."

lines = str.split("\n")

puts 'youが含まれている行'
lines.each do |line|
  if line =~ /[Yy]ou/
    puts line
  end
end

puts '行末に,が来ている行'
lines.each do |line|
  if line =~ /,$/
    puts line
  end
end

puts 'iがきて2文字置いてlがくる行'
lines.each do |line|
  if line =~ /i.{2}l/
    puts line
  end
end