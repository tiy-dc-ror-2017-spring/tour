class BookingsController < ApplicationController
  before_action :authorize!, except: [:index]

  def index
    @bookings = Booking.all

    # render "index"
  end

  def new
    @booking = Booking.new
    render "new" # If your view name matches your action name it will be looked up by default.
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.agent = current_user
    if @booking.save
      redirect_to bookings_path, flash: { success: "Booking Created successfully" }
    else
      flash[:error] = "Booking could not be saved!"

      render "new"
    end
  end

  def edit
    @booking = Booking.find(params[:id])
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.update(booking_params)
    redirect_to "/bookings"
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to "/bookings"
  end

  private def booking_params
    params.require("booking").permit(
      "customer_name",
      "destination",
      "bob",
      "start_at",
      "end_at"
    )
  end

  private def authorize!
    if !current_user
      session[:error] = "Go Away"
      redirect_to new_sessions_path
    end
  end
end
