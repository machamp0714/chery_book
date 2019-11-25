# frozen_string_literal: true

require 'date'

# Su Mo Tu We Th Fr Sa
#                 1  2
#  3  4  5  6  7  8  9
# 10 11 12 13 14 15 16
# 17 18 19 20 21 22 23
# 24 25 26 27 28 29 30

def init_week
  Array.new(7, '')
end

def display(callendar)
  callendar.each do |row|
    puts row.map { |cell| cell.to_s.rjust(2) }.join(' ')
  end
end

callendar = [%w[Su Mo Tu We Tn Fr Sa]]
week = init_week

start_date = Date.new(2019, 11, 1)
end_date = start_date.next_month - 1

(start_date..end_date).each do |date|
  week[date.wday] = date.day

  if week.last != '' || date == end_date
    callendar << week
    week = init_week
  end
end

display(callendar)
