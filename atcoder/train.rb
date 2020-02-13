# frozen_string_literal: true

def dna_strand(dna)
  dna.tr("ACTG", "TGAC")
end

# def dna_strand(dna)
#   dna.gsub(/[ATGC]/, "A" => "T", "T" => "A", "C" => "G", "G" => "C")
# end

# 自分が書いたコード
# def number(bus_stops)
#   remining = 0

#   bus_stops.each do |stop|
#     enter = stop[0]
#     leave = stop[1]

#     remining = remining + enter - leave
#   end
#   remining
# end

def number(bus_stops)
  # [[0, 0], [1, 2]]の様な多重配列を(on, off)という構造で受け取る
  # reduceメソッド 畳み込み演算を行う injectと同じ
  bus_stops.map { |(on, off)| on - off }.reduce(:+)
end

# 自分が書いたコード
# def reverse_letter(string)
#   string.scan(/[a-z]/).join.reverse
# end

def reverse_letter(string)
  # delete(*strs) -> String 指定した文字列を排除した文字列を返す。
  # ただし、strsの先頭が^0-3の様に^が付いていると、0-3以外を表す。
  string.delete("^A-Za-z").reverse
end
