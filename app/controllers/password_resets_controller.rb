class PasswordResetsController < ApplicationController
  def new

  end

  def create
    @user = User.find_by(email: params[:email])
    if @user.present?
      UserMailer.with(user: @user).reset.deliver_now
    end
    redirect_to root_path, notice: "The email is send !"
  end

  def edit
    @user = User.find_signed!(params[:token], purpose: "password_reset")
  rescue ActiveSupport::MessageVerifier::InvalidSignature
    redirect_to sign_in_path, alert: "Your token has expires !"
  end

  def update
    @user = User.find_signed!(params[:token], purpose: "password_reset")
    if @user.update(password_params)
      redirect_to sign_in_path, notice: "Your password was reset successfully"
    else
      render :edit
    end
  rescue ActiveSupport::MessageVerifier::InvalidSignature
    redirect_to sign_in_path, alert: "Error to reset the password !"
  end

  private
  def password_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end