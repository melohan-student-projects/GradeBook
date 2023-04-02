class Promotion < ApplicationRecord
  belongs_to :teacher, class_name: 'User'
  has_many :user_promotions
  has_many :students, through: :user_promotions
end