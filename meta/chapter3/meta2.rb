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

  def get_display_info(id)
    'EIZO'
  end

  def get_display_price(id)
    120
  end
end

class Computer < BasicObject
  def initialize(computer_id, data_source)
    @id = computer_id
    @data_source = data_source
  end

  def method_missing(name)
    # superは現在のメソッドがオーバーライドしているメソッドを呼び出す。
    # 引数が省略されると現在のメソッドの引数をそのまま引き継ぐ。
    # respond_to? オブジェクトがメソッドを呼び出せるなら真を返す
    super unless @data_source.respond_to?("get_#{name}_info")
    info = @data_source.send("get_#{name}_info", @id)
    price = @data_source.send("get_#{name}_price", @id)
    result = "#{name.capitalize}: #{info}($#{price})"
    return "#{result}" if price >= 100
    result
  end
  # method_missingをオーバーライドするときは、respond_to_missing?もオーバーライドする
  # def respond_to_missing?(method, include_private=false)
  #   @data_source.respond_to?("get_#{method}_info") || super
  # end
end

computer = Computer.new(40, DS.new)
puts computer.mouse
# puts computer.respond_to?(:mouse) # respond_to?はrespond_to_missing?を呼び出している
p computer.display
