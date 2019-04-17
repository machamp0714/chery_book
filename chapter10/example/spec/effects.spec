require './lib/effects'

RSpec.describe 'effects' do
  it 'reverseメソッドが期待する値を返すこと' do
    effect = Effects.reverse
    expect(effect.call("Ruby is fun!")).to eq "ybuR si !nuf"
  end

  it 'echoメソッドが期待する値を返すこと' do
    effect = Effects.echo(2)
    expect(effect.call("abc")).to eq "aabbcc"

    effect = Effects.echo(3)
    expect(effect.call("abc")).to eq "aaabbbccc"
  end

  it 'loudメソッドが正しい値を返すこと' do
    effect = Effects.loud(2)
    expect(effect.call("abc")).to eq "ABC!!"

    effect = Effects.loud(3)
    expect(effect.call("abc")).to eq "ABC!!!"
  end
end