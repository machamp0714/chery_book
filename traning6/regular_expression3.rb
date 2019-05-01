# scanメソッド
p '123 456 789'.scan(/\d+/)

word = "Hokkaido:Sapporo Aomori:Aomori Tochigi:utsunomiya"
hash = {}
word.scan(/(\w+):(\w+)/) { |word1, word2| hash[word1] = word2 }
p hash

# []
text = '郵便番号は123-4567です。本当は322-0528です。'
text[/\d{3}-\d{4}/]

text = '誕生日は1977年7月17日です。'
text[/(\d+)年(\d+)月(\d+)日/, 2]

# slice!
text = '郵便番号は123-4567です。'
text.slice!(/\d{3}-\d{4}/)
puts text

# split
text = '123,456-789'

p text.split(',')
p text.split(/,|-/)

# gsub
text = '123,456-789'

p text.gsub(',', ':')

p text.gsub(/,|-/, ':')

text = '誕生日は1977年7月17日です。'

p text.gsub(/(\d+)年(\d+)月(\d+)日/, '\1-\2-\3')

p text.gsub(/(?<year>\d+)年(?<month>\d+)月(?<day>\d+)日/, '\k<year>-\k<month>-\k<day>') 

text = '123,456-789'

hash = { ',' => '.', '-' => '/' }
p text.gsub(/,|-/, hash)

p text.gsub(/,|-/) { |matched| matched == ',' ? '.' : '/' }

text.gsub!(/,|-/, ':')
p text