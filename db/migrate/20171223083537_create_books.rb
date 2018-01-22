class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.string :isbn_code
      t.string :release
      t.string :image_url
      t.string :url

      t.timestamps
    end
  end
end
