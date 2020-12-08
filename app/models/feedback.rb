class Feedback < ApplicationRecord
  belongs_to :user
  belongs_to :post

  has_many :feedbacks, dependent: :destroy
  validate :post_cannot_have_more_than_ten_feedbacks

  after_create :capacity_reached


  def post_cannot_have_more_than_ten_feedbacks
    unless self.post.feedbacks.count <= 10
      errors.add(:number_of_feedbacks, "Cannot exceed 10")
    end
  end

  def capacity_reached
    if self.post.feedbacks.count == 10
      notification = NewFeedback.with(feedback: @feedback, post: @post)
      notification.deliver(@feedback.post.user)
    end
  end
end
