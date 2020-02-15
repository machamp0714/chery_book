# frozen_string_literal: true

# 選挙問題
# 立候補者に支持者が一人もいない場合
# 立候補者一人に支持者がいて支持者なしがいない場合
# 立候補者一人に支持者がいて、支持者なしもいる場合
# 立候補者二人に支持者がいて、支持者なしがいる場合
# 立候補者二人に支持者がいて、支持者なしもいる場合

candidate_count, voters_count, speach_count = gets.chomp.split.map(&:to_i)
speach_order = []

speach_count.times do
  speach_order << gets.chomp.to_i
end

before_vorting_result = (1..candidate_count).each_with_object({}) do |candidate, result|
  result.merge!(candidate => 0)
end

vorting_result = speach_order.each_with_object(before_vorting_result) do |candidate, result|
  if voters_count.positive?
    voters_count -= 1
    result[candidate] += 1
  end

  vorting = before_vorting_result.each_with_object(result) do |(key, _), hash|
    next unless key != candidate

    voter_count = hash[key]
    if voter_count.positive?
      hash[key] -= 1
      hash[candidate] += 1
    end
  end

  result.merge!(vorting)
end

MAX_CANDIDATE = vorting_result.values.max

sorted_result = vorting_result.each_with_object([]) do |(key, value), result|
  result << key if value >= MAX_CANDIDATE
end

sorted_result.each do |num|
  puts num
end
