require './lib/convert_length'

RSpec.describe 'convert_length' do
    describe 'convert_length' do
        it 'returns correct length' do
            expect(convert_length(1, 'm', 'in')).to eq 39.37
        end
    end
end