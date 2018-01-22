class AddIndexToBookOrdersIsbnCode < ActiveRecord::Migration[5.1]
  def change
    add_index :book_orders, :isbn_code, unique: true
  end
end
