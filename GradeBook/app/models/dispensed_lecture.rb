class DispensedLecture < ApplicationRecord
  belongs_to :lecture
  belongs_to :promotion
  belongs_to :user
  belongs_to :semester
  has_many :grades

  delegate :name, to: :lecture, prefix: true
end
