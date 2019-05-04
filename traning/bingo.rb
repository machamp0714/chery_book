record_0 = %w(B I N G O)
B = 1..15
I = 16..30
N = 31..45
G = 46..60
O = 61..75
BINGO = [B, I, N, G, O]
record_1 = BINGO.map { |r| r.to_a.sample }
record_2 = BINGO.map { |r| r.to_a.sample }
record_3 = BINGO.map { |r| r.to_a.sample }
record_4 = BINGO.map { |r| r.to_a.sample }
record_5 = BINGO.map { |r| r.to_a.sample }
# puts record_0.join(' | ')
# puts record_1.join(' | ')
# puts record_2.join(' | ') 
# puts record_3.join(' | ') 
# puts record_4.join(' | ') 
# puts record_5.join(' | ') 

m = [*1..9]
n = [*1..9]
for i in [*0..8]
  for j in [*0..8]
    print m[i] * n[j]
  end
end