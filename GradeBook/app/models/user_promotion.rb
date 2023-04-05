class UserPromotion < ApplicationRecord
  belongs_to :promotion
  has_many :users, through: :user_promotions
  delegate :name, to: :promotion, prefix: true
  delegate :full_name, to: :user, prefix: true
end
