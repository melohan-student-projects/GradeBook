class Semester < ApplicationRecord
  has_many :dispensed_lectures

  validates :name, presence: true
end
