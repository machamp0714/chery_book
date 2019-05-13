require './lib/team'

RSpec.describe 'deep_freeze' do
  it '配列がfreezeされているか' do
    expect(Team::COUNTRIES.frozen?).to be_truthy
  end

  it '配列の要素もfreezeされているか' do
    expect(Team::COUNTRIES.all?(&:frozen?)).to be_truthy
  end

  it 'ハッシュ自身がfreezeされているか' do
    expect(Bank::CURRENCIES.frozen?).to be_truthy
  end

  it 'ハッシュの要素もfreezeされているか' do
    expect(Bank::CURRENCIES.all? { |key, value| key.frozen? && value.frozen? }).to be_truthy
  end
end