class PasswordResetsController < ApplicationController
  def new

  end

  def create
    @user = User.find_by(email: params[:email])
    if @user.present?
      UserMailer.with(user: @user).reset.deliver_now
    else
      redirect_to root_path, notice: "The email is send !"
    end
  end
end