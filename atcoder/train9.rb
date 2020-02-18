# frozen_string_literal: true

class Comment
  attr_accessor :id, :reply_id, :like

  def initialize(id, reply_id, like)
    @id = id
    @reply_id = reply_id
    @like = like
  end

  def reply_comments(comment_list)
    comment_list.select { |comment| id == comment.reply_id }
  end

  def calc_likes_count(comment_list, memo)
    reply_comments = self.reply_comments(comment_list)

    return memo[id] = like if reply_comments.empty?
    return memo[id] unless memo[id].nil?

    memo[id] = like + reply_comments.map { |comment| comment.calc_likes_count(comment_list, memo) }.reduce(:+)
  end
end

def convert_type(id)
  if id == "None"
    id
  else
    id.to_i
  end
end

memo = []
comment_list = []
comment_count = gets.chomp.to_i

comment_count.times do
  id, reply_id, like = gets.chomp.split
  comment = Comment.new(id.to_i, convert_type(reply_id), like.to_i)
  comment_list << comment
end

comment_like_relation = comment_list.each_with_object({}) do |comment, hash|
  hash.merge!(comment.id => comment.calc_likes_count(comment_list, memo))
end

maximum_like = comment_like_relation.values.max

comment_ids = comment_like_relation.each_with_object([]) do |(key, value), result|
  result << key if value == maximum_like
end

p comment_ids.min
