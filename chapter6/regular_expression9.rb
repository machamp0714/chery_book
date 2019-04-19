# 6.5.3 正規表現オブジェクト作成時のオプション

p 'HELLO' =~ /hello/i # iオプションを使うと大文字と小文字を区別しない

regexp = Regexp.new('hello', Regexp::IGNORECASE) # Regexp::IGNORECASEという定数を使う
p 'HELLO' =~ regexp

p "HELLO\nBYE" =~ /HELLO.BYE/m # mオプションを使うと.が改行文字にマッチする

regexp = Regexp.new('HELLO.BYE', Regexp::MULTILINE)
p "HELLO\nBYE" =~ regexp

regexp = /
  \d{3} # 郵便番号の先頭３文桁
  - # 区切り文字
  \d{4} # 郵便番号の末尾４桁
/x
p '123-4567' =~ regexp # xオプションを使うと空白文字が無視される

pattern = <<'TEXT'
  \d{3} # 郵便番号の先頭３桁
  - # 区切り文字
  \d{4} # 郵便番号の下４桁
TEXT
reg = Regexp.new(pattern, Regexp::EXTENDED)
p '123-4567' =~ reg