UNITS = { m: 1.00, in: 39.37, ft: 3.28 } # 変更する予定のないオブジェクトはメソッドの外で定数として定義する
def convert_length(length, from: :m, to: :m)
    (UNITS[to] / UNITS[from] * length).round(2)
end