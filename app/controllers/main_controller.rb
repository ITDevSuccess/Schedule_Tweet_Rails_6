class MainController < ApplicationController
  def index
    flash.now[:notice] = "Logged in successfully !"
    flash[:alert] = "Invalid email or password"
  end
end