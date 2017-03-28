class AddCustomerIdToBookings < ActiveRecord::Migration[5.0]
  def change
    add_column :bookings, :customer_id, :integer
  end
end
