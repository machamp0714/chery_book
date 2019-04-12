# includeされたモジュールの有無を確確認する
module Loggable

end

class Product
  include Loggable

end

p Product.include?(Loggable)
p Product.included_modules # includeされてるモジュールの配列を返す
p Product.ancestors # モジュールだけでなくスパークラスの情報も配列になって返ってくる