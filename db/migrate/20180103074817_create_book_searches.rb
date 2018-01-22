class CreateBookSearches < ActiveRecord::Migration[5.1]
  def change
    create_table :book_searches do |t|

      t.timestamps
    end
  end
end
