class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user

  scope :sort_by_comment_time, ->{order :created_at}

  validates :post_id, presence: true
  validates :user_id, presence: true
  validates :content, presence: true,
    length: {maximum: Settings.comment.content.max_length}
end
