class AddExperienceToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :experience, :string
  end
end
