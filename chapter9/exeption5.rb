# 9.2.8 例外発生時にもう一度処理をやり直すretry
retry_count = 0
begin 
  puts '処理を開始します'
  1 / 0
rescue
  retry_count += 1
  if retry_count <= 3
    puts "retryします #{retry_count}回目"
    retry
  else
    puts 'retryに失敗しました。'
  end
end