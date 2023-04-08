class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :user_promotions
  has_many :users, through: :user_promotions
  has_many :promotions, through: :user_promotions
  has_many :dispensed_lectures, foreign_key: :user_id
  has_many :lectures, through: :dispensed_lectures
  has_many :grades_given, foreign_key: :teacher_id, class_name: 'Grade'
  has_many :grades_received, foreign_key: :student_id, class_name: 'Grade'

  belongs_to :user_type

  def full_name
    "#{firstname} #{lastname}"
  end

  def teacher?
    check_slug("TEA")
  end

  def student?
    check_slug("STU")
  end

  def check_slug(role)
    user_type.slug == role
  end

  def grades
    Grade.where(student_id: self.id)
  end

  def lectures
    Lecture.joins(:dispensed_lectures).where(dispensed_lectures: {user_id: self.id})
  end

end
