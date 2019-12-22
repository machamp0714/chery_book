require_relative "../lib/keitai"

describe "Keitai" do
  it "20を入力した場合" do
    expect(Keitai.message("20")).to eq("a")
  end

  it "220を入力した場合" do
    expect(Keitai.message("220")).to eq("b")
  end

  it "440330555055506660を入力した場合" do
    expect(Keitai.message("440330555055506660")).to eq("hello")
  end

  it "44033055505550666011011111090666077705550301110" do
    expect(Keitai.message("44033055505550666011011111090666077705550301110")).to eq("hello, world!")
  end

  it "66660を入力した場合" do
    expect(Keitai.message("66660")).to eq("m")
  end

  it "5" do
    expect(Keitai.message("5")).to eq("")
  end

  it "0" do
    expect(Keitai.message("0")).to eq("")
  end
end
