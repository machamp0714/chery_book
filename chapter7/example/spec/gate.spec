require './lib/gate.rb'
require './lib/ticket.rb'

RSpec.describe "gate_program" do
  let(:umeda) { Gate.new('umeda') }
  let(:juso) { Gate.new('juso') }
  let(:mikuni) { Gate.new('mikuni') }

  describe '運賃が十分な場合' do
    it '梅田から十三へ' do
      ticket = Ticket.new(150)

      umeda.enter(ticket)
      expect(juso.exit(ticket)).to eq '出場できます'
    end

    it '梅田から三国へ' do
      ticket = Ticket.new(190)
      umeda.enter(ticket)
      expect(mikuni.exit(ticket)).to eq '出場できます'
    end

    it '十三から三国へ' do
      ticket = Ticket.new(150)
      juso.enter(ticket)
      expect(mikuni.exit(ticket)).to eq '出場できます'
    end
  end

  describe "運賃が不足している場合" do
    it '梅田から三国へ' do
      ticket = Ticket.new(150)

      umeda.enter(ticket)
      expect(mikuni.exit(ticket)).to eq '出場できません'
    end
  end
end