require 'rubygems'
require 'dbi'

dbh = DBI.connect('DBI:SQLite3:fruits.db')

sth = dbh.execute('select * from products')
p sth.class
sth.each do |row|
  p row.class
  row.each_with_name do |val, name|
    puts "#{name}: #{val.to_s}"
  end
  puts "----------------------"
end
sth.finish
dbh.disconnect