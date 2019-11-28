# frozen_string_literal: true

text = <<~TEXT
  名前：伊藤淳一
  電話：03(1234)5678
  ？？：9999-99-9999
  ？？：03(1234-5678
  住所：兵庫県西脇市板波町1-2-3
TEXT

numbers = text.scan(/0[0-9]\d{0,3}[-(]\d{1,4}[-)]\d{4}/)

numbers.grep(/\(\d+\)|-\d+-/)

text2 = <<~TEXT
  クープバゲットのパンは美味しかった。
  今日はクープ バゲットさんに行きました。
  クープ　バゲットのパンは最高。
  ジャムおじさんのパン、ジャムが入ってた。
  また行きたいです。クープ・バゲット。
  クープ・バケットのパン、売り切れだった（><）
TEXT

text2.split(/\n/).grep(/クープ.?バ[ゲケ]ット/)

# ------------------------------------------------------

html = <<~HTML
  <select name="game_console">
  <option value="none"></option>
  <option value="wii_u" selected>Wii U</option>
  <option value="ps4">プレステ4</option>
  <option value="gb">ゲームボーイ</option>
  </select>
HTML

replace = html.gsub(%r{<option value="(\w+)"(?: selected)?>(.*)</option>}, '\1, \2')

# ------------------------------------------------------
ruby = <<~TEXT
  def hello(name)
    puts "Hello, \#{name}!"
  end

  hello('Alice')

  hello('Bob')

  hello('Carol')
TEXT

# puts ruby
# puts ruby.gsub(/^[ \t]+$/, '')

indent = <<~TEXT
  Lorem ipsum dolor sit amet.
  Vestibulum luctus est ut mauris tempor tincidunt.
           Suspendisse eget metus
        Curabitur nec urna eget ligula accumsan congue.
TEXT

# puts indent.gsub(/^[ \t]+/, '')

space = <<~TEXT
  {
    japan:	'yen',
    america:'dollar',
    italy:     'euro'
  }
TEXT

space.gsub(/:\s*/, ': ')

log = <<~TEXT
  Feb 14 07:33:02 app/web.1:  Completed 302 Found ...
  Feb 14 07:36:46 heroku/api:  Starting process ...
  Feb 14 07:36:50 heroku/scheduler.7625:  Starting ...
  Feb 14 07:36:50 heroku/scheduler.7625:  State ...
  Feb 14 07:36:54 heroku/router:  at=info method=...
  Feb 14 07:36:54 app/web.1:  Started HEAD "/" ...
  Feb 14 07:36:54 app/web.1:  Completed 200 ...
TEXT

log.gsub(%r{^.+heroku/(api|scheduler).+\n}, '')

filename = <<~TEXT
  type=zip; filename=users.zip; size=1024;
  type=xml; filename=posts.xml; size=2048;
TEXT

# filename.scan(/(?<=filename=)[^;]+/)

filename.scan(/filename=[^;]+/).map { |s| s.split('=').last }

band = <<-TEXT
John:guitar, George:guitar, Paul:bass, Ringo:drum
Freddie:vocal, Brian:guitar, John:bass, Roger:drum
TEXT

band.scan(/\w+(?=:bass)/)

bad_text = "_a__________________________________"

p bad_text.scan(/(_+|\w+)*a/)