require_relative "../lib/excel"

describe "Excel" do
  it "正しく結果が出力される事" do
    expect { Excel.output }.to output(expected_result).to_stdout
  end

  def expected_result
<<-TEXT
  9|  85|  92|  20| 206
 68|  25|  80|  55| 228
 43|  96|  71|  73| 283
 43|  19|  20|  87| 169
 95|  66|  73|  62| 296
258| 291| 336| 297| 1182
TEXT
  end

  def expected_output
    file_path = File.expand_path("./resource/output.txt")
    File.read(file_path)
  end
end
