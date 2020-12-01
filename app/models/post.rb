class Post < ApplicationRecord
  belongs_to :user
  has_many :feedbacks

  has_many_attached :photos

  validates :title, presence: true
  validates :description, presence: true
end
