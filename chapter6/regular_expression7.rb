# 6.5.1 正規表現オブジェクトを作成する様々な方法
# reg = Regexp.new('\d{3}-\d{4}')

reg = %r{\d{3}-\d{4}}  # %rを使う
p reg.class
text = '郵便番号は123-4567です。'
m = text.match(reg)
p m[0]

pattern = '\d{3}-\d{4}'
p '123-4567' =~ /#{pattern}/