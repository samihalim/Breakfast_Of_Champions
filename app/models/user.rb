class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  validates :name, presence: true
  validates :user_name, presence: true
  validates :location, presence: true
  validates :biography, presence: true
  validates :experience, presence: true

  has_many :feedbacks
  has_many :posts

  has_one_attached :photo

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
