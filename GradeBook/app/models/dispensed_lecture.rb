class DispensedLecture < ApplicationRecord
  belongs_to :lecture
  belongs_to :promotion
  belongs_to :user
  belongs_to :semester
end
