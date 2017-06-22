class User < ApplicationRecord
  has_many :microposts, dependent: :destroy
  has_many :active_relationships, class_name: Relationship.name,
    foreign_key: :follower_id, dependent: :destroy
  has_many :passive_relationships, class_name: Relationship.name,
    foreign_key: :followed_id, dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower

  scope :sort_by_name, ->{order :full_name}

  before_save {user_name.downcase!}
  has_secure_password

  VALID_USERNAME_REGEX = /\A[a-z]{1}[\w+\-.]+\z/i
  validates :full_name, presence: true,
    length: {maximum: Settings.user.full_name.max_length}
  validates :user_name, presence: true,
    length: {maximum: Settings.user.user_name.max_length,
      minimum: Settings.user.user_name.min_length},
    format: {with: VALID_USERNAME_REGEX},
    uniqueness: {case_sensitive: false}
  validates :password, length: {minimum: Settings.user.password.min_length},
    allow_nil: true
end
