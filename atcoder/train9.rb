# frozen_string_literal: true

class Comment
  attr_accessor :id, :reply_id, :like

  def initialize(id, reply_id, like)
    @id = id
    @reply_id = reply_id
    @like = like
  end

  def reply_comments(comment_list)
    comment_list.select { |comment| id == comment.id }
  end

  def calc_likes_count(reply_comments, _comment_list)
    return like if reply_comments.empty?
  end
end

def convert_type(id)
  if id == "None"
    id
  else
    id.to_i
  end
end

comment_list = []
comment_count = gets.chomp.to_i

comment_count.times do
  id, reply_id, like = gets.chomp.split
  comment = Comment.new(id.to_i, convert_type(reply_id), like.to_i)
  comment_list << comment
end

comment_like_relation = comment_list.each_with_object({}) do |comment, hash|
  reply_comments = comment.reply_comments(comment_list)
  hash.merge!(comment.id => comment.calc_likes_count(reply_comments, comment_list))
end

p comment_like_relation
