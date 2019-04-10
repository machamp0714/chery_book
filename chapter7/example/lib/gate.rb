class Gate
  STATIONS = %w(umeda juso mikuni)
  PRICES = [150, 190]
  def initialize(name)
    @name = name
  end

  def enter(ticket)
    ticket.stamp(@name)
  end

  def exit(ticket)
    price = calc(ticket)
    if ticket.price >= price
      "出場できます"
    else
      "出場できません"
    end
  end

  def calc(ticket)
    from = STATIONS.index(ticket.stamped_at)
    to = STATIONS.index(@name)
    gate_distance = to - from
    PRICES[gate_distance - 1]
  end
end