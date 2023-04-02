class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :user_type
  has_many :promotions, foreign_key: :teacher_id

  def full_name
    "#{firstname} #{lastname}"
  end

end
