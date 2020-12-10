class Feedback < ApplicationRecord
  before_destroy :destroy_notifications
  belongs_to :user
  belongs_to :post

  has_many :votes, dependent: :destroy
  has_many :feedbacks, dependent: :destroy
  validate :post_cannot_have_more_than_ten_feedbacks

  after_create :post_cannot_have_more_than_ten_feedbacks

  def post_cannot_have_more_than_ten_feedbacks
    unless self.post.feedbacks.count <= 10
      errors.add(:number_of_feedbacks, "Cannot exceed 10")
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
