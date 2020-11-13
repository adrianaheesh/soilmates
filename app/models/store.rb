class Store < ApplicationRecord
  belongs_to :user
  has_many :products, dependent: :destroy
  has_one_attached :banner
end
