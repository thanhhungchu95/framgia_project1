class Post < ApplicationRecord
  belongs_to :user

  scope :sort_by_post_time, ->{order created_at: :desc}

  validates :user_id, presence: true
  validates :content, presence: true,
    length: {maximum: Settings.post.content.max_length}
end
