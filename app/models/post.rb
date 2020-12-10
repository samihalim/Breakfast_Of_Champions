class Post < ApplicationRecord
  before_destroy :destroy_notifications
  belongs_to :user
  has_many :feedbacks, dependent: :destroy
  has_many :post_categories, dependent: :destroy
  has_many :categories, through: :post_categories

  has_many_attached :photos

  validate :has_attached_image

  validates :title, presence: true
  validates :description, presence: true

  def has_attached_image
    unless self.photos.attached?
      errors.add(:number_of_photos, "Needs at least one photo")
    end
  end

  def notifications
    # Exact match
    # @notifications ||= Notification.where(params: { post: self })

    # Or Postgres syntax to query the post key in the JSON column
    @notifications ||= Notification.where("params->'post' = ?", Noticed::Coder.dump(self).to_json)
  end


  def destroy_notifications
    notifications.destroy_all
  end
end
