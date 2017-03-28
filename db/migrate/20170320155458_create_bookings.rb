class CreateBookings < ActiveRecord::Migration[5.0]
  def change
    create_table :bookings do |t|
      t.string :customer_name
      t.string :destination
      t.datetime :start_at
      t.datetime :end_at

      t.timestamps
    end
  end
end
