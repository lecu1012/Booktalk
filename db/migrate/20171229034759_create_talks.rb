class CreateTalks < ActiveRecord::Migration[5.1]
  def change
    create_table :talks do |t|
      t.integer :book_id
      t.integer :user_id
      t.string  :highlight
      t.string  :message

      t.timestamps
    end
  end
end
