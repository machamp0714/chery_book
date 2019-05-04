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

  def mouse
    component :mouse
  end

  def cpu
    component :cpu
  end

  def keyboard
    component :keyboard
  end

  def component(name)
    info = @data_source.send "get_#{name}_info", @id
    price = @data_source.send "get_#{name}_price", @id
    result = "#{name.capitalize}: #{info} ($#{price})"
    return "#{result}" if price >= 100
    result
  end
end

ds = DS.new
computer = Computer.new(2, ds)
p computer.mouse
p computer.cpu
p computer.keyboard