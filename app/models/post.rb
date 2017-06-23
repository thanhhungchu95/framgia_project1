class Post < ApplicationRecord
  belongs_to :user

  has_many :comments, dependent: :destroy

  scope :sort_by_post_time, ->{order created_at: :desc}
  scope :load_feed, ->(id, following_ids) do
    where "user_id IN (#{following_ids}) OR user_id = :user_id",
      following_ids: following_ids, user_id: id
  end

  validates :user_id, presence: true
  validates :title, presence: true,
    length: {maximum: Settings.post.title.max_length}
  validates :content, presence: true,
    length: {maximum: Settings.post.content.max_length}
end
