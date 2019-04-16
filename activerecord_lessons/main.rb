require 'active_record'
require 'pp'
require 'logger'

ActiveRecord::Base.logger = Logger.new(STDOUT)

ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: './myapp.db'
)

class User < ActiveRecord::Base
  # class method
  # def self.top3
  #   select("id, name, age").order(:age).limit(3)
  # end

  # scope
  # scope :top3, -> { select("id, name, age").order(:age).limit(3) }

  def self.top(num)
    select("id, name, age").order(:age).limit(num)
  end

  scope :top, -> (num) { select("id, name, age").order(:age).limit(num) } # scopeを使うと、チェーンメソッドでこの後にメソッドをつなぐことが出来る。

end

# insert
# user = User.new(name: 'tatsuya', age: 27)
# user.save

# User.create(name: 'hoshi', age: 26)

User.delete_all

User.create(name: 'tanaka', age: 26)
User.create(name: 'hayashi', age: 29)
User.create(name: 'ishikawa', age: 56)
User.create(name: 'hoshi', age: 34)
User.create(name: 'oide', age: 12)

# pp User.select("id, name, age").all

# pp User.select("id, name, age").first
# pp User.select("id, name, age").last

# pp User.select("id, name, age").find(3)

# pp User.select("id, name, age").find_by(name: 'oide')
# pp User.select("id, name, age").find_by_name 'oide'

# pp User.select("id, name, age").find_by_name! 'kirito' # !をつけるとエラーを返してくれる

## where

# pp User.select("id, name, age").where(age: 20..29)
# pp User.select("id, name, age").where(age: [12, 56]) ageをピンポイントで検索する

## AND
# pp User.select("id, name, age").where("age >= 20").where("age < 30")
# pp User.select("id, name, age").where("age >= 20 and age < 30")

## OR
# pp User.select("id, name, age").where("age >= 30 or age < 20")

## NOT
# pp User.select("id, name, age").where.not(id: 3)

## プレースホルダー 条件文字列に値を埋め込むときは必ずプレースホルダーを使う
min = 20
max = 30
# pp User.select("id, name, age").where("age >= #{min} and age < #{max}") # NG!!! 悪意のあるコードが紛れ込む可能性があるから！
# pp User.select("id, name, age").where("age >= ? and age < ?", min, max)
# pp User.select("id, name, age").where("age >= :min and age < :max", { min: min, max: max }) # ハッシュを使うこともできる
# pp User.select("id, name, age").where("name like ?", "%e")


## order
# pp User.select("id, name, age").order("age")
# pp User.select("id, name, age").order(age: :desc)

## limit
# pp User.select("id, name, age").order(:age).limit(3) # 件数を制限する
# pp User.select("id, name, age").order(:age).offset(1) # 最初のn件を省いて取得する

# 抽出条件を登録しよう
# pp User.top3

## find_or_create_by
# user = User.find_or_create_by(name: 'hayashi')
# user = User.find_or_create_by(name: 'uzumaki') do |u|
#   u.age = 18
# end
# pp user

## update
# User.update(1, age: 50)
# User.where(name: 'ishikawa').update(age: 24)
# User.where(name: 'hoshi').update(age: 30, name: 'suwa')
# User.where(" age >= 30 ").update(age: 80)
# User.where("age >= 20").update_all("age = age + 2")
# pp User.select("id, name, age").all

## delete: 単機能だけど高速
## destroy: 高機能だけど低速

# User.delete(1)
# User.where("age >= 20").delete_all
# pp User.select("id, name, age").all