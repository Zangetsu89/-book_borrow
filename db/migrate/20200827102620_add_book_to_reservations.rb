class AddBookToReservations < ActiveRecord::Migration[6.0]
  def change
    add_reference :reservations, :book, foreign_key: true
  end
end
