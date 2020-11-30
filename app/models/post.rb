class Post < ApplicationRecord
  belongs_to :user
  has_many :feedbacks

  validates :title, presence: true
  validates :description, presence: true
end
