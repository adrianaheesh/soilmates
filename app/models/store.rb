class Store < ApplicationRecord
  belongs_to :user
  has_many :products, dependent: :destroy
  has_many :store_reviews, dependent: :destroy 
  has_one_attached :banner, dependent: :destroy
end
