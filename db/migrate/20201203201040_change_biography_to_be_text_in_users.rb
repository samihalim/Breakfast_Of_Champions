class ChangeBiographyToBeTextInUsers < ActiveRecord::Migration[6.0]
  def change
    change_column :users, :biography, :text
  end
end
