require 'test_helper'

class BookingTest < ActiveSupport::TestCase
  test "booking" do
    assert Booking
  end

  test "booking has a start_at time" do
    james_vaca = Booking.create!(customer_name: "James", start_at: DateTime.new(2015, 5, 10))

    assert james_vaca.persisted?
    assert_equal DateTime.new(2015, 5, 10), james_vaca.start_at
  end
end
