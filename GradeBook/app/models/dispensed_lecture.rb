class DispensedLecture < ApplicationRecord
  belongs_to :lecture
  belongs_to :promotion
  belongs_to :semester
  belongs_to :teacher, class_name: "User"
end
