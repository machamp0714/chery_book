require './lib/word_synth'

RSpec.describe 'word_synth' do
  it 'エフェクトを追加しない場合' do
    synth = WordSynth.new
    expect(synth.play("abc")).to eq "abc"
  end

  it 'リバースエフェクトを適用した場合' do
    synth = WordSynth.new
    synth.add_effect(Effects.reverse)
    expect(synth.play("abc")).to eq "cba"
  end

  it '全てのエフェクトを適用した場合' do
    synth = WordSynth.new
    synth.add_effect(Effects.reverse)
    synth.add_effect(Effects.echo(2))
    synth.add_effect(Effects.loud(2))
    expect(synth.play("abc")).to eq "CCBBAA!!"
  end
end