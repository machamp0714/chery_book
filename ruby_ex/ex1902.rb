require 'pstore'

# DBをオープンする
db = PStore.new('fruitdb')

# 読み込み専用の時に書き込み処理を実行するとエラーが出る
db.transaction(true) do
  db[:food] = 'pafe'
end