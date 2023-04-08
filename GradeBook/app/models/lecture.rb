class Lecture < ApplicationRecord
  belongs_to :category, class_name: 'Category'
  has_many :dispensed_lectures
  has_many :promotions, through: :dispensed_lectures
  has_many :grades, through: :dispensed_lectures


  validates :name, presence: true
  validates :description, presence: true

  delegate :name, to: :category, prefix: true, allow_nil: true
end