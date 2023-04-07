class Lecture < ApplicationRecord
  delegate :name, to: :category, prefix: true, allow_nil: true
  belongs_to :category, class_name: 'Category'
  has_many :dispensed_lectures
  has_many :promotions, through: :dispensed_lectures
end