class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(name: params[:session][:name].downcase)
    if user
      log_in user
      redirect_back_or user
    else
      message = "User not found"
      flash[:danger] = message
      redirect_to root_url
    end
  end

  def destroy
  end
end
