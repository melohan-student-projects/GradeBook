class Promotion < ApplicationRecord
  has_many :user_promotions
  has_many :users, through: :user_promotions
  has_many :dispensed_lectures
  has_many :lectures, through: :dispensed_lectures

  validates :name, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true

end
