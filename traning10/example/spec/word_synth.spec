require './lib/word_synth'

RSpec.describe 'word_synth' do
  it 'effectを何も適応しなかった場合' do
    synth = WordSynth.new
    expect(synth.play("Ruby is fun!")).to eq "Ruby is fun!"
  end

  it 'reverse_effectを適応した場合' do
    synth = WordSynth.new
    synth.add_effect(Effects.reverse)
    expect(synth.play("Ruby is fun!")).to eq "ybuR si !nuf"
  end

  it 'echo_effectを適応した場合' do
    synth = WordSynth.new
    synth.add_effect(Effects.echo(2))
    expect(synth.play("Ruby is fun!")).to eq "RRuubbyy iiss ffuunn!!"
  end

  it 'loud_effectを適応した場合' do
    synth = WordSynth.new
    synth.add_effect(Effects.loud(3))
    expect(synth.play("Ruby is fun!")).to eq "RUBY!!! IS!!! FUN!!!!"
  end

  it '全てのeffectを適応した場合' do
    synth = WordSynth.new
    synth.add_effect(Effects.reverse)
    synth.add_effect(Effects.echo(2))
    synth.add_effect(Effects.loud(2))
    expect(synth.play("abc")).to eq "CCBBAA!!"
  end
end