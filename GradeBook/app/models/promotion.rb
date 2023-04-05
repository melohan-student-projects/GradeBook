class Promotion < ApplicationRecord
  has_many :user_promotions
  has_many :users
  has_many :dispensed_lectures
  validates :user_id, presence: true
end