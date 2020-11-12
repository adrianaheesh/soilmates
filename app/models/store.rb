class Store < ApplicationRecord
  belongs_to :user
  has_one_attached :banner
end
