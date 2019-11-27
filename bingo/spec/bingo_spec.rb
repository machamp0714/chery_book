# frozen_string_literal: true

require_relative '../lib/bingo.rb'

describe Bingo do
  let(:bingo) { Bingo.new }

  it 'headerが正しく出力されること' do
    expect(bingo.header).to eq(
      ' B |  I |  N |  G |  O'
    )
  end

  it 'Bの列には1~15の数字が出力されること' do
    expect(bingo.column(:B)).to include(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15)
  end

  it 'Iの列には16~30の数字が含まれること' do
  end

  it 'Nの列には31~45の数字が含まれること' do
  end

  it 'Gの列には46~60の数字が含まれること' do
  end

  it 'Oの列には61~75の数字が含まれること' do
  end

  it 'Nの列のindex2は空白であること' do
  end
end
