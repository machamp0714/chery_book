text = <<TEXT
i love Ruby
Python is a grate language
Java and JavaScript is different
TEXT

p text.scan(/[A-Z][A-Za-z]+/)

profile = <<TEXT
名前: 大出達也
電話: 03-1234-5678
電話: 090-1234-5678
電話: 0795-12-3456
電話: 04992-1-2345
住所: 栃木県
TEXT

p profile.scan(/\d{2,5}-\d{1,4}-\d{4}/) # \dは半角数字、{n,m}は直前の文字がn個以上、m個以下を表すメタ文字

number = <<NUMBER
電話：03(1234)5678
電話：090-1234-5678
電話：0795(12)3456
電話：04992-1-2345
NUMBER

p number.scan(/\d{2,5}[-()]\d{1,4}[-)]\d{4}/) # [AB]はAまたはBの意味を表す

number2 = <<NUMBER
電話：03(1234)5678
電話：090-1234-5678
電話：0795(12)3456
電話：04992-1-2345
NUMBER

p number2.scan(/[-09]/)

text = <<-TEXT
名前：伊藤淳一
電話：03(1234)5678
？？：9999-99-9999
？？：03(1234-5678
住所：兵庫県西脇市板波町1-2-3
TEXT
numbers = text.scan(/0[1-9]\d{0,3}[-(]\d{1,4}[-)]\d{4}/)
p numbers.grep(/\(\d+\)|-\d+-/)