class Post < ApplicationRecord
  belongs_to :user

  has_many :comments, dependent: :destroy

  scope :sort_by_post_time, ->{order created_at: :desc}

  validates :user_id, presence: true
  validates :title, presence: true,
    length: {maximum: Settings.post.title.max_length}
  validates :content, presence: true,
    length: {maximum: Settings.post.content.max_length}
end
