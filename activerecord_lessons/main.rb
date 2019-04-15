require 'active_record'
require 'pp'
require 'logger'

ActiveRecord::Base.logger = Logger.new(STDOUT)

ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: './myapp.db'
)

class User < ActiveRecord::Base

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
pp User.select("id, name, age").where.not(id: 3)

