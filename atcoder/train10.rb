# frozen_string_literal: true

# 累乗

# 配列の最小値
def min(arr)
  return arr[0] if arr.length == 1 # 数字が一つとき（一番簡単な場合）はその一つが最少値

  x = arr.shift
  y = min(arr)
  x < y ? x : y # min()で返されるのは先頭要素以外の中での最少値なので、それと先頭要素を比べて少ない方を返せばいい
end

# フィボナッチ数列
def fib(n)
  return 0 if n == 0
  return 1 if n == 1

  fib(n - 1) + fib(n - 2)
end

# 上記のコードは「同じ計算を何度も実行する効率の悪い」コードです。
# 例えば、n = 6 のときはfib関数を25回も呼び出している。

fib = Array.new(50)
(2..50).each do |i|
  fib[0] = 0
  fib[1] = 1

  fib[i] = fib[i - 1] + fib[i - 2]
end
# このコードならn項のフィボナッチ数列を求めるのにn-1回の計算で済む

# メモ化を使ってフィボナッチ数列を求める
memo = Array.new(50, -1) # -1は未計算であることを示す
def memo_fib(n, memo)
  return 0 if n == 0
  return 1 if n == 1
  return memo[n] if memo[n] != -1

  memo[n] = memo_fib(n - 1, memo) + memo_fib(n - 2, memo)
end

# 動的計画法

# 入門編１
# N 個の足場があって、i 番目の足場の高さは hi です。
# 最初、足場 1 にカエルがいて、ぴょんぴょん跳ねながら足場 N へと向かいます。カエルは足場 i にいるときに

# 足場 i から足場 i+1 へと移動する (そのコストは |hi−hi+1|)
# 足場 i から足場 i+2 へと移動する (そのコストは |hi−hi+2|)
# のいずれかの行動を選べます。カエルが足場 1 から足場 N へと移動するのに必要な最小コストを求めよ。

N = gets.chomp.to_i
h = gets.chomp.split.map(&:to_i)

# 初期条件
dp = []
dp[0] = 0
dp[1] = dp[0] + (h[0] - h[1]).abs

def chmin(a, b)
  if a < b
    a
  else
    b
  end
end

(2..(N - 1)).each do |i|
  dp[i] = chmin((dp[i - 1] + (h[i] - h[i - 1]).abs), (dp[i - 2] + (h[i - 2] - h[i]).abs))
end
