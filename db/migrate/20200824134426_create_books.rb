class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :book_title
      t.integer :isbn_number
      t.integer :book_price
      t.boolean :new
      t.string :description
      t.string :location

      t.timestamps
    end
  end
end
