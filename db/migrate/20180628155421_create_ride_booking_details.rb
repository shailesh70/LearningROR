class CreateRideBookingDetails < ActiveRecord::Migration
  def change
    create_table :ride_booking_details do |t|
      t.string :payment_mode
      t.integer :amount
      t.integer :seats
      t.string :transaction_id
      t.string :msg
      t.references :booking_user_id
      t.references :ride_id

      t.timestamps
    end
    add_index :ride_booking_details, :booking_user_id_id
    add_index :ride_booking_details, :ride_id_id
  end
end
