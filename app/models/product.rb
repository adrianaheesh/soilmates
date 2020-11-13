class Product < ApplicationRecord
  belongs_to :store
  has_one_attached :image, dependent: :destroy
end
