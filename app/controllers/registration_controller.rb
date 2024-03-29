class RegistrationController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, notice: "Successfully create account"
    else
      # flash[:alert] = "Error !"
      render :new
    end
    # render plain: params[:user]

  end

  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end