# sample.txtを読み込みモードでオープンする
file = File.open('sample.txt', 'r:UTF-8')
# ファイルからデータを全て読み込み、それを表示する
puts file.read
# ファイルを閉じる
file.close