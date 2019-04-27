require './lib/rgb_convert'

RSpec.describe 'rgb_convert' do
  it 'to_hex' do
    expect(to_hex(0, 0, 0)).to eq '#000000'
    expect(to_hex(255, 255, 255)).to eq '#ffffff'
  end

  it 'to_ints' do
    expect(to_ints('#000000')).to eq [0, 0, 0]
    expect(to_ints('#ffffff')).to eq [255, 255, 255]
  end
end