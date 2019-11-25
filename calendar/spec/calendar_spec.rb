# frozen_string_literal: true

require_relative '../app/calendar'

RSpec.describe 'Calendar' do
  it '月と西暦が表示されること' do
    expect(output_month_and_year).to eq(
      'Novembar 2019'
    )
  end

  before do
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
    @callendar = callendar
  end

  it '日付が表示されること' do
    callendar = <<~ DATE
    Su Mo Tu We Tn Fr Sa
                    1  2
     3  4  5  6  7  8  9
    10 11 12 13 14 15 16
    17 18 19 20 21 22 23
    24 25 26 27 28 29 30
    DATE
    expect(display(@callendar)).to eq(callendar)
  end
end
