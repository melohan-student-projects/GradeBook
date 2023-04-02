class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  def full_name
    "#{firstname} #{lastname}"
  end

  belongs_to :user_type
  has_many :promotions, foreign_key: :teacher_id
  has_many :user_promotions, foreign_key: :student_id

end
