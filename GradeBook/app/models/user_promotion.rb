class UserPromotion < ApplicationRecord
  belongs_to :promotion
  belongs_to :student, class_name: "User"

  validates :promotion_id, presence: true
  validates :student_id, presence: true
end
