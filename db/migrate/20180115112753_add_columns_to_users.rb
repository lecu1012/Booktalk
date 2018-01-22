class AddColumnsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :image, :text
    add_column :users, :profile, :string
  end
end
