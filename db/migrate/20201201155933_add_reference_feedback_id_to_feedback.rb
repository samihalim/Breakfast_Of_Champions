class AddReferenceFeedbackIdToFeedback < ActiveRecord::Migration[6.0]
  def change
    add_reference :feedbacks, :feedback, foreign_key: true
  end
end
