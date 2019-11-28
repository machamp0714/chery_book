require_relative '../lib/drink.rb'

describe BonusDrink do
  it '購入した本数が０本の時、０本飲めること' do
    expect(BonusDrink.total_count_for(0)).to eq(0)
  end

  it '購入した本数が1本の時、1本飲めること' do
    expect(BonusDrink.total_count_for(1)).to eq(1)
  end

  it '購入した本数が3本の時、4本飲めること' do
    expect(BonusDrink.total_count_for(3)).to eq(4)
  end

  it '購入した本数が11本の時、16本飲めること' do
    expect(BonusDrink.total_count_for(11)).to eq(14)
  end

  it '購入した本数が100本の時、133本飲めること' do
    expect(BonusDrink.total_count_for(100)).to eq(133)
  end
end