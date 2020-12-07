class Upvote < ApplicationRecord
  belongs_to :feedback
  belongs_to :user

  validates :feedback, uniqueness: { scope: :user }
  validates :user, uniqueness: { scope: :post }
end
