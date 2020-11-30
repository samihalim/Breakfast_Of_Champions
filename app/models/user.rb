class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :email, email: true
  validates :password, presence: true, length: { minimum: 6 }

  has_many :feedbacks
  has_many :posts

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
