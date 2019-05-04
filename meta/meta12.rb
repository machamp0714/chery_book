class DS
  def get_mouse_info(id)
    'Wireless Touch'
  end

  def get_mouse_price(id)
    60
  end

  def get_cpu_info(id)
    '2.9 Ghz quad-core'
  end

  def get_cpu_price(id)
    120
  end

  def get_keyboard_info(id)
    'apple keyboard'
  end

  def get_keyboard_price(id)
    80
  end
end

class Computer
  def initialize(computer_id, data_source)
    @id = computer_id
    @data_source = data_source
    # Array#grepにメソッドを渡すと、正規表現にマッチした要素全てに対してブロックが評価される。
    # そして、正規表現の()にマッチした文字列はグローバル変数$1に格納される
    data_source.methods.grep(/get_(.*)_info$/) { Computer.define_component $1 }
  end

  def self.define_component(name)
    define_method(name) do
      info = @data_source.send "get_#{name}_info", @id
      price = @data_source.send "get_#{name}_price", @id
      result = "#{name.capitalize}: #{info} ($#{price})" # 最初の１文字を大文字にするcapitalizeメソッド
      return "#{result}" if price >= 100
      result
    end
  end
end

computer = Computer.new(2, DS.new)
p computer.mouse
p computer.cpu
p computer.keyboard