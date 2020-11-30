class Category < ApplicationRecord
  has_many :post_categories

  validates :name, presence: true
end
