class CreateReservations < ActiveRecord::Migration[6.0]
  def change
    create_table :reservations do |t|
      t.date :start_date
      t.date :end_date
      t.string :approved
      t.string :cancelled
      t.string :payment

      t.timestamps
    end
  end
end
