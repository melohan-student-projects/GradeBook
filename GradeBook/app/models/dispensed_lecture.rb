class DispensedLecture < ApplicationRecord
  belongs_to :lecture
  belongs_to :promotion
  belongs_to :semester
  belongs_to :user
end
