require './lib/loan'

RSpec.describe 'Bookworn' do
  it 'to_sメソッド' do
    Loan.class_eval { @time_class = FakeTime.now }
    loan = Loan.new('War and peace')
    expect(loan.to_s).to eq "War and peace loaned on Mon Apr 06 12:15:50"
  end
end