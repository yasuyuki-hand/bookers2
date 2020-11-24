class Book < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy
  # has_many :favorited_users, through: :likes, source: :users
  has_many :book_comments, dependent: :destroy
  validates :title, presence: true, length: { maximum: 200 }
  default_scope -> { order('created_at DESC') }
  validates :body, presence: true, length: { maximum: 200 }
  

end
