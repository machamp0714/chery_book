class Excel
  INPUT = [
    [9, 85, 92, 20],
    [68, 25, 80, 55],
    [43, 96, 71, 73],
    [43, 19, 20, 87],
    [95, 66, 73, 62]
  ]

  def self.output
    new.output
  end

  def output
    input = INPUT.dup

    row_sum_array = input.map { |row|
      row.inject(0) { |sum, num| sum += num }
    }
    col_sum_array = input.transpose.map { |col| 
      col.inject(0) { |sum, num| sum += num }
    }
    total_int = row_sum_array.inject(0) { |sum, num| sum += num }
    col_sum_array.push(total_int)

    array = input.each_with_object([]) { |row, result|
      add_sum_row = row.push(row_sum_array.delete_at(0))
      result.push(add_sum_row)
    }
    array.push(col_sum_array)

    output_array = array.map { |row|
      row.map { |num| num.to_s.rjust(3) }
    }

    output_array.each { |row|
      puts row.join("| ")
    }
  end
end

# 処理の流れ
# 合計値を求める
# 得られた値をINPUTに挿入
# 出力を整形する
