require './lib/word_synth'

RSpec.describe 'word synth' do

  let(:synth) { WordSynth.new }

  it 'エフェクトがない場合' do
    expect(synth.play("Ruby is fun!")).to eq "Ruby is fun!"
  end

  it 'reverseエフェクトを適応した場合' do
    synth.add_effect(Effects.reverse)
    expect(synth.play("Ruby is fun!")).to eq "ybuR si !nuf"
  end

  it 'echoエフェクトを追加した場合' do
    synth.add_effect(Effects.echo(2))
    expect(synth.play("Ruby is fun!")).to eq "RRuubbyy iiss ffuunn!!"
  end

  it 'loudエフェクトを追加した場合' do
    synth.add_effect(Effects.loud(3))
    expect(synth.play("Ruby is fun")).to eq "RUBY!!! IS!!! FUN!!!" 
  end

  it '全てのエフェクトを追加kした場合' do
    synth.add_effect(Effects.reverse)
    synth.add_effect(Effects.echo(2))
    synth.add_effect(Effects.loud(2))
    expect(synth.play("あいう")).to eq "うういいああ!!"
  end
end