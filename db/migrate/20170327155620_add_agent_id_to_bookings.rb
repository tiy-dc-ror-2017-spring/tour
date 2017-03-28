class AddAgentIdToBookings < ActiveRecord::Migration[5.0]
  def change
    add_column :bookings, :agent_id, :integer
  end
end
