class CreateReservations < ActiveRecord::Migration[6.0]
  def change
    create_table :reservations do |t|
      t.date :start_date
      t.date :end_date
      t.boolean :approved
      t.boolean :cancelled
      t.boolean :payment

      t.timestamps
    end
  end
end
