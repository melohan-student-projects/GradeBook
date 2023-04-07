class Grade < ApplicationRecord
  belongs_to :student, class_name: 'User'
  belongs_to :teacher, class_name: 'User'
  belongs_to :dispensed_lecture
  delegate :lecture, :promotion, to: :dispensed_lecture

  validates :result, numericality: { greater_than_or_equal_to: 1.0, less_than_or_equal_to: 6.0, message: "must be between 1.0 and 6.0" }
  validates :weight, numericality: { greater_than_or_equal_to: 0.1, less_than_or_equal_to: 1.0 }
end
