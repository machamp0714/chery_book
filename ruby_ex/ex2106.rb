require 'rubygems'
require 'dbi'

dbh = DBI.connect('DBI:SQLite3:student01.db')

dbh.select_all('select * from students where age > 50') do |row|
  puts "row = #{row}"
  puts "name = #{row[0]}"
  puts "age = #{row[1]}"
end

dbh.disconnect