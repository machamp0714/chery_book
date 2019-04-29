require './lib/ticket'

class Gate
  STATIONS = %i(umeda juso mikuni)
  FARES = [150, 190]

  def initialize(name)
    @name = name
  end

  def enter(ticket)
    ticket.stamp(@name)
  end

  def exit(ticket)
    if ticket.price >= calc(ticket)
      "ご乗車ありがとうございました。"
    else
      "運賃が不足しています。"
    end
  end

  def calc(ticket)
    distance = STATIONS.index(@name) - STATIONS.index(ticket.stamped_at)
    return FARES[distance.abs - 1]
  end
end