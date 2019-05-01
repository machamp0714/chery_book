require './lib/convert_hash'

RSpec.describe 'convert_hash' do
  it 'シンボルがキーである場合' do
    old_syntax = <<~TEXT
    {
      :name => 'Alice',
      :age => 20,
      :gender => :female
    }
    TEXT
    expected = <<~TEXT
    {
      name: 'Alice',
      age: 20,
      gender: :female
    }
    TEXT
    expect(convert_hash_syntax(old_syntax)).to eq expected
  end
end