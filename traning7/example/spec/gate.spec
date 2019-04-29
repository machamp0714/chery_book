require './lib/gate'
require './lib/ticket'

RSpec.describe 'gate_program' do
  describe '運賃が足りている場合' do
    it '梅田で入場し、十三で出場する場合' do
      umeda = Gate.new(:umeda)
      juso = Gate.new(:juso)

      ticket = Ticket.new(150)

      umeda.enter(ticket)
      
      expect(juso.exit(ticket)).to eq 'ご乗車ありがとうございました。'
    end

    it '梅田で入場し、三国で出場する場合' do
      umeda = Gate.new(:umeda)
      mikuni = Gate.new(:mikuni)

      ticket = Ticket.new(250)

      umeda.enter(ticket)

      expect(mikuni.exit(ticket)).to eq 'ご乗車ありがとうございました。'
    end

    it '三国で入場し、梅田で出場する場合' do
      umeda = Gate.new(:umeda)
      mikuni = Gate.new(:mikuni)

      ticket = Ticket.new(190)

      mikuni.enter(ticket)

      expect(umeda.exit(ticket)).to eq 'ご乗車ありがとうございました。'
    end
  end

  describe '運賃が足りない場合' do
    it '梅田で入場し、三国で出場する場合' do
      umeda = Gate.new(:umeda)
      mikuni = Gate.new(:mikuni)

      ticket = Ticket.new(150)

      umeda.enter(ticket)

      expect(mikuni.exit(ticket)).to eq '運賃が不足しています。'
    end
  end
end