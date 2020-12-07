class Feedback < ApplicationRecord
  belongs_to :user
  belongs_to :post

  has_many :feedbacks, dependent: :destroy
  has_many :upvotes, dependent: :destroy

  def score
    upvotes.count
  end

end
