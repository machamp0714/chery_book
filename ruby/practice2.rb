# 11. 配列やハッシュの生成
(1..3).map { |i| i**2 }
(1..3).map { |i| [i, i**2] }.to_h
Array.new(3) { |i| (i + 1)**2 } # Array.newを使うと、余計なオブジェクトを生成しないので、効率的。

# 12. 配列やハッシュの生成2
# フィボナッチ数列を作成
array = [1, 1]
# (10 - 2).times do
#   num = array[-1] + array[-2]
#   array << num
#   array => [1, 1, 2]
# end

# (10 - 2).times do
#   e = hash[hash.size] + hash[hash.size - 1]
#   hash[hash.size + 1] = e
#   hash
# end

# 無駄があるコード　＝＞　イテレーションごとにオブジェクトを生成する
(10 - 2).times.inject(array) { |a, _| a + [a[-1] + a[-2]] }

hash = { 1 => 1, 2 => 1 }
(10 - 2).times.inject(hash) { |h, i| h.merge(i + 3 => h[i + 1] + h[i + 2]) }

# オブジェクトを破壊的に加工していく
# (10 - 2).times.inject(array.dup) { |a, _| a.push(a[-1] + a[-2]) }
# (10 - 2).times.inject(hash.dup) { |h, i| h.merge!(i + 3 => h[i + 1] + h[i + 2]) }

(10 - 2).times.with_object(array.dup) { |_, a| a.push(a[-1] + a[-2]) }
(10 - 2).times.with_object(hash.dup) { |i, h| h.merge!(i + 3 => h[i + 1] + h[i + 2]) }

# 13. 配列の要素やハッシュの値の平滑化
hash = {
  name: ["田中", nil, "太郎"],
  address: ["東京都", ["港区", ["芝浦"]]],
  age: [20],
  membership: [false]
}
# hash.each { |key, val| { key: val.flatten } }
hash.transform_values! { |value| value.flatten }

# 14. 配列からの指定された長さの切り出し
languages = %w[Mandarin Spanish English Hindi Arabic]
languages[2..3] # わざわざ範囲オブジェクトを生成したいるところに無駄がある
languages[2, 2]

# 15. 埋め込まれた配列やハッシュの内部の値の参照
teeth = {
  "切歯" => { "中" => 1, "側_" => 2 },
  "臼歯" => { 
    "小_" => [4, 5],
    "大_" => [6, 7, 8]
  }
}
# []メソッドを使うのは間違っている
# fetchメソッドを使う
teeth.fetch("臼歯", {}).fetch("大_", {}).fetch(2, nil)
teeth.fetch("切歯", {}).fetch("小_", {}).fetch("側_", nil)

# digメソッドを使う self以下のネストしたオブジェクトも再帰的に参照して返す。ない場合はnilを返す
teeth.dig("臼歯", "大_", 2)
teeth.dig("切歯", "小_", "側_") 

# 16. 配列やハッシュをふるいにかける
n = 100
max = Math.sqrt(n).floor

(2..10).each_with_object((2..100).to_a) do |i, array|
  array.reject! { |j| (j % i).zero? unless i == j }
end

# 17. 条件を満たす配列やハッシュの値の参
fib = (20 - 2).times.inject(array) { |a, _| a + [a[-1] + a[-2]] }
fib.find { |i| (i % 13).zero? }

hash = { 1 => 1, 2 => 1 }
fibh = (20 - 2).times.inject(hash) { |h, i| h.merge(i + 3 => h[i + 1] + h[i + 2]) }
fibh.find { |k, v| (v % 11).zero? }

# 18. 与えられた順序に沿った配列やハッシュの要素の選択と並び替え
keys = %w[garnet amethyst aquamarine diamond emerald pearl ruby periodot sapphire opal topaz turqoise]

array = %w[garnet amethyst bloodstone sapphire agate emerald onyx carneian chrysolite beryl topaz ruby]

hash = {
  "garnet" => "hoge",
  "bloodstone" => "foo",
  "sapphire" => "baz"
}

# keys.select { |w| array.include?(w) }
keys & array # 配列同士の積集合

hash.slice(*keys) # slice => 引数で指定されたキーとその値を含むハッシュを返す。 *Arrayで配列を展開する。

# 19. 関数による配列の並び替え
array = [1, 17, 14, 9, 3, 16, 15, 3, 18, 13]

array.sort
# array.sort { |a, b| -(a <=> b) } # 無駄がある
# array.sort { |a, b| Math.cos(a) <=> Math.cos(b) }　# 無駄がある
array.sort.reverse # 降順
array.sort_by { |x| Math.cos(x) } # sortメソッドにブロックを渡すのではなく、sort_byを使う

# 20. ハッシュの修正
hash1 = {
  "Perl" => "Warhol",
  "Python" => "van Rossum",
  "Ruby" => "Mazt"
}
hash2 = { "Perl" => "Wall", "Ruby" => "Matz" }

hash2.each { |k, v| hash[k] = v }
hash1.merge!(hash2)
