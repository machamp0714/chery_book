# 6 7 4
# cathy 4
# eijiro 2
# alice 6
# dad 3
# betty 5
# franca 1
# 2 eijiro 1
# 3 alice 6
# 4 alice 1
# 4 franca 3
# 5 cathy 7
# 9 dad 2
# 12 betty 4

members, record_num, rank = gets.chomp.split.map(&:to_i)

last_month_record = []
this_month_record = []

members.times do
  last_month_record << gets.chomp.split
end

record_num.times do
  this_month_record << gets.chomp.split
end

# valueを降順でソートし、同率のvalueはkeyで昇順でソートする。
def sort(hash)
  hash.to_a.sort do |a, b|
    (b[1] <=> a[1]) * 2 + (a[0] <=> b[0])
  end.to_h
end

def ranking(hash)
  hash.each_with_object({}).with_index do |((name, _), result), index|
    result.merge!(name => index + 1)
  end
end

# { name => distance } という形に変形する。
last_month_record = last_month_record.to_h.transform_values(&:to_i)
this_month_record = this_month_record.map { |e| [e[1], e[2].to_i] }.each_with_object(Hash.new(0)) { |(name, distance), hash| hash.merge!(name => hash[name] + distance) }

# 先月の記録に残っているが、今月は記録にない部員の記録も入れて置く。
this_month_record = last_month_record.each_with_object(this_month_record) do |(name, _), result|
  result.merge!(name => 0) if result[name].zero?
end

# 先月と今月のrank位までのランキングを求める。
last_month_sorted = sort(last_month_record).to_a[0, rank].to_h
this_month_sorted = sort(this_month_record).to_a[0, rank].to_h

# { name => rank } という形のハッシュを求める。
last_month_ranking = ranking(last_month_sorted)
this_month_ranking = ranking(this_month_sorted)

# [[name, distance, label]]という形の多次元配列を作る。
output = this_month_ranking.each_with_object([]) do |(name, rank), result|
  last_month_rank = last_month_ranking[name]
  distance = this_month_record[name]

  label = if rank == last_month_rank
            "same"
          elsif last_month_rank.nil?
            "new"
          elsif rank < last_month_rank
            "up"
          elsif rank > last_month_rank
            "down"
          end
  result << [name, distance, label]
end

# name distance label という形で出力する
output.each do |row|
  puts row.join(" ")
end
