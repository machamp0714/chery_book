require './lib/team'
require './lib/bank'

RSpec.describe 'deep_freezable' do
  it '配列の場合' do
    expect(Team::COUNTRIES).to be_frozen
    expect(Team::COUNTRIES.all? { |country| country.frozen? }).to be_truthy
  end

  it 'ハッシュの場合' do
    expect(Bank::CURRENCIES.all? { |key, value| key.frozen? && value.frozen? }).to be_truthy
    expect(Bank::CURRENCIES).to be_frozen
  end
end