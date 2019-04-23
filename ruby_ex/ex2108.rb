require 'rubygems'
require 'dbi'

dbh = DBI.connect('DBI:SQLite3:fruits.db')

dbh.do("insert into products values(
  1,
  'りんご',
  '甘い',
  'aaa.jpg',
  200,
  '2009-02-01 09:15:00'
);")

dbh.disconnect