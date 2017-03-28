class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new

    @user.email = user_params[:email]
    @user.nickname = user_params[:nickname]
    @user.password = user_params[:password]
    @user.password_confirmation = user_params[:password_confirmation]

    if @user.save
      # Do the actual login thing?
      redirect_to bookings_path
    else
      render "new"
    end
  end

  private def user_params
    params.require(:user).permit(
      :email,
      :nickname,
      :password,
      :password_confirmation
    )
  end
end
