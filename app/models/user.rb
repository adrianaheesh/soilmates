class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :store, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :store_reviews, dependent: :destroy
  has_many :orders, dependent: :destroy
end

