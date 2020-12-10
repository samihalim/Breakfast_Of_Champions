class Post < ApplicationRecord
  belongs_to :user
  has_many :feedbacks, dependent: :destroy
  has_many :post_categories, dependent: :destroy
  has_many :categories, through: :post_categories
  #has_many :notifications, through: :feedbacks, dependent: :destroy

  has_many_attached :photos

  validate :has_attached_image

  validates :title, presence: true
  validates :description, presence: true

  def has_attached_image
    unless self.photos.attached?
      errors.add(:number_of_photos, "Needs at least one photo")
    end
  end
end
