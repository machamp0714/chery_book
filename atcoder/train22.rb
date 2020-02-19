regrex = /\A^[a-z][a-z0-9\-.]+[a-z]@[a-z][a-z0-9.]{1,}\.[a-z]+$\z/i
email = gets.chomp

if email =~ regrex
  puts "適切なメールアドレスです"
else
  puts "不適切なメールアドレスです"
end
