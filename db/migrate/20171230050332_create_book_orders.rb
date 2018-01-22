class CreateBookOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :book_orders do |t|
      t.string :title
      t.string :author
      t.string :image_url
      t.string :url
      t.string :isbn_code
      t.integer :order_count, default: 0

      t.timestamps
    end
  end
end
