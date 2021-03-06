class StoreReview < ApplicationRecord
  belongs_to :user
  belongs_to :store

  self.per_page = 3

  validates :rating, 
            presence: true
  validates :comment, 
            presence: true,
            length: { maximum: 500 }
  validates :user,
            presence: true
end
