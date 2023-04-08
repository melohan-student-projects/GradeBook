class DispensedLecture < ApplicationRecord
  belongs_to :lecture
  belongs_to :promotion
  belongs_to :user
  belongs_to :semester
  has_many :grades

  delegate :name, to: :lecture, prefix: true

  validates :lecture, presence: true
  validates :promotion, presence: true
  validates :user, presence: true
  validates :semester, presence: true
end
