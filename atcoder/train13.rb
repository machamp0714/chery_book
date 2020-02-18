# frozen_string_literal: true

class Taxi
  attr_reader :first_ride_distance, :first_ride_price, :addition_distance, :addition_price

  def initialize(first_ride_distance, first_ride_price, addition_distance, addition_price)
    @first_ride_distance = first_ride_distance
    @first_ride_price = first_ride_price
    @addition_distance = addition_distance
    @addition_price = addition_price
  end
end

type_count, distance = gets.chomp.split.map(&:to_i)
taxis = []

type_count.times do
  first_ride_distance, first_ride_price, addition_distance, addition_price = gets.chomp.split.map(&:to_i)
  taxis << Taxi.new(first_ride_distance, first_ride_price, addition_distance, addition_price)
end

result = taxis.each_with_object([]) do |taxi, array|
  remaining_distance = distance - taxi.first_ride_distance

  if remaining_distance.negative?
    array << taxi.first_ride_price
  elsif remaining_distance <= taxi.addition_distance || remaining_distance.zero?
    array << taxi.first_ride_price + taxi.addition_price
  else
    price = taxi.first_ride_price
    while remaining_distance >= 0
      price += taxi.addition_price
      remaining_distance -= taxi.addition_distance
    end
    array << price
  end
end

min_price = result.min
max_price = result.max

puts "#{min_price} #{max_price}"
