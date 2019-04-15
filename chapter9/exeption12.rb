# 9.6.5 begin/endを省略するrescue
require 'date'

# def to_date(string)
#   begin
#     Date.parse(string)
#   rescue ArgumentError
#     nil
#   end
# end

def to_date(string)
  Date.parse(string) rescue nil # rescueを修飾子として使う.ただし、例外クラスを指定することは出来ない。
end

p to_date("2019-04-16")
p to_date("2019-13-54")