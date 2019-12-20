require "csv"
require "date"

class Syukujitsu
  # pathを絶対パスに展開
  CSV_PATH = File.expand_path("../syukuzitsu.csv", __dir__)
  ROW_CYCLE = 2
  YEAR_COL = 0

  def self.parse(csv_path = CSV_PATH)
    new.parse(csv_path)
  end

  def parse(csv_path)
    pair_rows = generate_pair_rows(csv_path)
    pair_rows.map { |pair_cols|
      year = year_parse(pair_cols[YEAR_COL].first)
      [year, to_data(pair_cols)]
    }.to_h
  end

  private

  def generate_pair_rows(csv_path)
    # each_slice => ブロックを省略した場合は n 要素ずつ繰り返す Enumerator を返す。
    CSV.read(csv_path).transpose.each_slice(ROW_CYCLE).map(&:transpose)
  end

  def year_parse(text)
    text[/\d{4}/].to_i
  end

  def to_data(cols)
    cols.map { |name, date|
      parsed_date = try_date_parse(date)
      [parsed_date, name] if parsed_date
    }.compact.to_h # compact => Arrayからnilを取り除いた配列を返す
  end

  def try_date_parse(text)
    Date.parse(text) rescue nil
  end
end

Syukujitsu.parse