class Book < ApplicationRecord
  belongs_to :user
  
  validates :title, presence: true, length: { maximum: 200 }
  default_scope -> { order('created_at DESC') }
  validates :body, presence: true, length: { maximum: 200 }
  

end
