# 9.6.1 ensure
file = File.open('some.txt', 'w')
begin
  file << 'Hello'
ensure
  file.close
end