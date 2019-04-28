require './lib/length_convert.rb'

RSpec.describe 'length_convert' do
  it 'mをinchに変換する場合' do
    expect(length_convert(1, from: :m, to: :in)).to eq 39.37
    expect(length_convert(13, from: :m, to: :in)).to eq 511.81
  end

  it 'mをftに変換する場合' do
    expect(length_convert(1, from: :m, to: :ft)).to eq 3.28
  end

  it 'inをftに変換する場合' do
    expect(length_convert(1, from: :in, to: :ft)).to eq 0.08
  end

  it 'ftをinに変換する場合' do
    expect(length_convert(1, from: :ft, to: :in)).to eq 12.0
  end
end