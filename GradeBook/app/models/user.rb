class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  def full_name
    "#{firstname} #{lastname}"
  end

  belongs_to :user_type
  has_many :promotions
  has_many :users, through: :user_promotions
  has_many :promotions, through: :user_promotions
  has_many :dispensed_lectures
end
