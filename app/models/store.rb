class Store < ApplicationRecord
  belongs_to :user
  has_many :products, dependent: :destroy
  has_many :store_reviews, dependent: :destroy 
  has_one_attached :banner, dependent: :destroy
  has_many :orders, dependent: :destroy

  self.per_page = 6

  validates :name, 
            presence: true,
            uniqueness: true,
            length: { maximum: 30 }
  validates :description,
            presence: true,
            length: { maximum: 500 }
end
