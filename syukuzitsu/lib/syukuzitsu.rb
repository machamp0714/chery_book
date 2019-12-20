# frozen_string_literal: true

require "csv"

class Syukuzitsu
  def self.parse
    holidays = open_csv
    holidays.values.each do |hash|
      hash.reject! { |key, _| key.nil? || key.eql?("月日") }
    end
    holidays
  end

  private

  def open_csv
    File.open("./syukuzitsu.csv") do |f|
      csv = CSV.new(f)
      csv_parse(csv)
    end
  end

  def csv_parse(csv)
    csv.each_with_object(2016 => {}, 2017 => {}) do |row, hash|
      hash[2016].merge!(row[1] => row[0])
      hash[2017].merge!(row[3] => row[2])
    end
  end
end

Syukuzitsu.parse
