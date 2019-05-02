print "Text?: "
text = gets.chomp
begin
  print "Pattern?: "
  pattern = gets.chomp
  reg = Regexp.new(pattern)
rescue RegexpError => e
  puts "Invalid pattern: #{e.message}"
  retry
end

if reg =~ text
  matches = text.scan(reg)
  puts "Matched: #{matches.join(',')}"
else
  puts "Nothing matched."
end