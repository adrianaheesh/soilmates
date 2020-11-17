class Order < ApplicationRecord
  belongs_to :user, dependent: :destroy
  belongs_to :store, dependent: :destroy
  # has_many :order_products, dependent: :destroy

end
