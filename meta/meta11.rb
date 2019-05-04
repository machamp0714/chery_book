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
  # クラス直下で呼び出せるのはクラスメソッドだけ
  define_component :mouse
  define_component :cpu
  define_component :keyboard
end

computer = Computer.new(2, DS.new)
p computer.mouse
p computer.cpu
p computer.keyboard