class AddDescriptionToFeedbacks < ActiveRecord::Migration[6.0]
  def change
    add_column :feedbacks, :description, :text
  end
end
