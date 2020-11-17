class Product < ApplicationRecord
  belongs_to :store
  has_one_attached :image, dependent: :destroy
  has_many :favorites, dependent: :destroy

  validates :name, 
            presence: true
  validates :description, 
            presence: true,
            length: { maximum: 500 }
  validates :availability, 
            presence: true
  validates :category, 
            presence: true
  validates :price, 
            presence: true, 
            numericality: true,
            numericality: { greater_than: 0.01 }
end
