class AddUserIdToReservations < ActiveRecord::Migration[6.0]
  def change
    add_reference :reservations, :user
  end
end
