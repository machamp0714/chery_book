require './lib/team'
require './lib/bank'

RSpec.describe 'deep_freezable' do
  describe 'test deep_freezable' do
    it 'should be freeze to array' do
      expect(Team::COUNTRIES).to eq ['Japan', 'US', 'India']

      expect(Team::COUNTRIES.frozen?).to be_truthy

      numbers = [0, 1, 2]
      numbers.each do |n|
        expect(Team::COUNTRIES[n]).to be_truthy
      end
    end

    it 'should be freeze to hash' do
      expect(Bank::CURRENCIES.frozen?).to be_truthy

      Bank::CURRENCIES.each do |key, value|
        expect(key.frozen?).to be_truthy
        expect(value.frozen?).to be_truthy
      end
    end
  end
end