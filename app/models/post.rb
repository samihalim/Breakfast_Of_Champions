class Post < ApplicationRecord
  belongs_to :user
  has_many :feedbacks, dependent: :destroy
  has_many :post_categories, dependent: :destroy
  has_many :categories, through: :post_categories

  has_many_attached :photos

  validates :title, presence: true
  validates :description, presence: true
end
