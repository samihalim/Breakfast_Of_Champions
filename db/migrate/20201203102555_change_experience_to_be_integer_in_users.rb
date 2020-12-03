class ChangeExperienceToBeIntegerInUsers < ActiveRecord::Migration[6.0]
  def change
    change_column :users, :experience, :integer, using: 'experience::integer'
  end
end
