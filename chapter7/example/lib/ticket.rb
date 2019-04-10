class Ticket
  attr_accessor :price, :stamped_at

  def initialize(price)
    @price = price
  end

  def stamp(name)
    @stamped_at = name
  end
end