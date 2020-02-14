# frozen_string_literal: true

# 最遅出社時刻

interval_times = gets.chomp.split.map(&:to_i)
numbers = gets.chomp.to_i
train_times = []
numbers.times do
  train_times << gets.chomp.split.map(&:to_i)
end

def time(hour, min)
  Time.new(2020, 2, 14, hour, min)
end

TIMEOUT = time(8, 59)

view = train_times.each_with_object({}) do |time, hash|
  home_to_paiza = interval_times[0]
  paiza_time = time(time[0], time[1])

  time_to_work = paiza_time - (home_to_paiza * 60)
  arrival_time = time_to_work + interval_times.reduce(:+) * 60

  commuting_time = TIMEOUT - arrival_time

  hash.merge!(time_to_work => commuting_time) if commuting_time >= 0
end

min_time = view.values.min
result_time = view.key(min_time)

hour = result_time.hour
min = result_time.min

puts "#{hour.to_s.rjust(2, '0')}:#{min.to_s.rjust(2, '0')}"
