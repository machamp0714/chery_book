# frozen_string_literal: true

require 'date'

class CalendarRenderer
  def initialize(year, month)
    @first_date = Date.new(year, month, 1)
  end

  def to_s
    calendar_rows.join("\n")
  end

  def calendar_rows
    header_rows + body_rows
  end

  def header_rows
    sun_to_sat = 'Su Mo Tu We Tn Fr Sa'
    # center => 長さ width の文字列に self を中央寄せした文字列を返します。
    # rstrip => 末尾の空白を削除した文字列を返します。
    month_year = @first_date.strftime('%B %Y').center(sun_to_sat.size).rstrip
    [month_year, sun_to_sat]
  end

  def body_rows
    format_rows = lambda { |week|
      week.map { |date| date.nil? ? '  ' : date.strftime('%e') }.join(' ')
    }
    weeks_in_month.map { |week| format_rows.call(week) }
  end

  def weeks_in_month
    dates_in_month.inject([]) do |weeks, date|
      weeks << [] if weeks.empty? || date.sunday?
      # tapメソッドは、ブロック変数にレシーバ自身を入れてブロックを実行する。
      weeks.tap { |weeks| weeks.last[date.wday] = date }
    end
  end

  def dates_in_month
    last_date = @first_date.next_month.prev_day
    (@first_date..last_date).to_a
  end
end

calendar = CalendarRenderer.new(2019, 1)
puts calendar.to_s
