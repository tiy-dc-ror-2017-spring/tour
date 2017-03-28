require 'test_helper'

class BookingsControllerTest < ActionDispatch::IntegrationTest
  def save_and_open_screenshot(test_name)
    path = Rails.root.join("tmp", "#{self.class.name}_#{test_name}.html")
    File.write(path, @response.body)

    `open #{path}`
  end

  setup do
    post sessions_path, params: { email: users(:one).email, password: "123" }
  end

  test "should get index" do
    # robby = Booking.create(customer_name: "Robby Dore")

    get "/bookings"
    # Verify a status code
    assert_response :success

    assert_select "h1", "Bookings"
    assert_select "td", "Robby Dore"

    # save_and_open_screenshot(method_name) # Look at method above
  end

  test "should be able to see a form for a new booking" do
    get "/bookings/new"

    assert_response :success
    assert_select "form"
  end

  test "should be able to create a new booking" do
    post "/bookings", params: { booking: {
      customer_name: "Cher",
      destination: "Aruba",
      start_at: 10.days.ago,
      end_at: 3.days.from_now
    } }
    assert_response :redirect
    assert_redirected_to "/bookings"

    cher = Booking.where(customer_name: "Cher").first
    assert cher.persisted?
  end

  test "can edit a particular record" do
    moose = bookings(:poo_poo_head)
    get "/bookings/#{moose.id}/edit"

    assert_response :success
    assert_select "form"
  end

  test "can update a particular record" do
    moose = bookings(:poo_poo_head)
    patch "/bookings/#{moose.id}", params: { booking: { start_at: 900.days.ago } }

    assert_redirected_to "/bookings"

    moose.reload

    assert_in_delta 900.days.ago, moose.start_at, 1
  end

  test "can delete a record" do
    moose = bookings(:poo_poo_head)

    delete "/bookings/#{moose.id}"

    assert_redirected_to "/bookings"
    assert_raises ActiveRecord::RecordNotFound do
      moose.reload
    end
  end
end
